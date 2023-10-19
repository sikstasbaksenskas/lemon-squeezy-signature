# Description

Simple example for `Ruby on Rails` applications on how to ensure that [webhook requests](https://docs.lemonsqueezy.com/help/webhooks#signing-requests) are coming from [Lemon Squeezy](https://lemonsqueezy.com/).

## Simplified version

<div align="center">
  <img src="https://github.com/sikstasbaksenskas/lemon-squeezy-signature/assets/47524766/9d762bd7-08e4-4ca7-9ce2-9cb48710e580" >
</div>

## Notes

- To show this simple example, only relevant files, folders are displayed.
- Only `true` or `false` is being returned as `json`, which represents status of signature.
- skip `:verify_authenticity_token` is needed to enable specific action to receive third party requests.

## Improvements

When dealing with this specific functionality in `production`, some improvements could be done.

- `secret` that is being used for creating signature could be stored in `rails credentials`.
- Errors handling or additional logic could be implemented in case signature is invalid.
- Tests could be improved, in case errors handling or additional logic are implemented.
