Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244644;
	b=tPHIcNsP3k142GfoKdp8lxy9+5EabLlHV759+gFFv2HmWbpgGUg60Of4mKPkCrkIFXKR
	 rnEBJJewl7w/hF/7XVt8WdUB6PYuY7z3RZmsNXia5tPlcB5A8D2aG7NQbRUVH4iZR2AGS
	 iWk/7Z9YGiTwVIz6+hIxL20B/9ndet17Juud7sioar9A1sOHgITT9Dy3AO4gUgdIacHn6
	 NS/iykwS1rQc9sN+0ar2n0OmDCDPR+u8GpTYhs8fgpifz9xZFixlU/GArumUhjtE2Z7Tq
	 i+N7r7N1cUoShYLkGY4/DzDz7e/Lws55lrb5XdCTvFA6oNDBkI+jfI92tz2lL7wLroQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244644;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QMlo7+jEB71MGUq5QtgWcwM6R+YJMNjd9GK/TqlYSlQ=;
	b=ZWSdc7+lyi0102Hs8h6YsbGuIWEacuh8Q3fRBRkTgB806XcbkjQoC+AnT/f7l7bOtPFi
	 hVnH3+6Z9zs3XIOJy7mAx/N4SRFT1caCT/xVPmGL0Nk/2WpDNCKgYn43WDy+3ZKln4RZR
	 Tel5x0e55jCs1Xum8rmRpnRSTSCx8laKEZ0RvSSmx3GpnTH5EBn0PxesgenN6nojkYD7j
	 3Cge1RqLJpjWb+zT5+KuoAMgELFVTR8LwzKyIUpZXrMRvybjANczVnXhJhS9PCEEazq77
	 YAN3ZPinwMJ4dksBxYxVek5KRbIIMHjw29ImKKGuA2NpU+6hrq7/ibETemTtUB594ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGpDIrxX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D5606A32A;
	Sat, 21 Nov 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGpDIrxX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5991F000C4;
	Sat, 21 Nov 2026 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795244644;
	bh=QMlo7+jEB71MGUq5QtgWcwM6R+YJMNjd9GK/TqlYSlQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aGpDIrxXqTUP/Owfk5sbMkrc4YUC2amjmc9iGRTpY89FJRgb5/AQsw+62SuI5G953
	 TzDDeDeUT6Q8HLxTZ5P2KbCnTGqXip3ejXBAEnQ4YYutFGqBVx83FzbqTDbDT8tr7w
	 OaDDz7yXF4lps6fLTJbX9LC2FNR3i8/GqXPvxUbHZAlc8rvKIb7jcRBoGL9lvLoA2f
	 OV19ghbPBCy6xSWhqfP+JhgrMAdr9EizDgvlQ3yf7z+EwgXIbnwudyfO7uYmIN3Z45
	 Ybbhfxhkw2pfI9yy0p2spwmYGxLMbtBgktOHaDcGfSC9b3qVwYEbeAzU7R8mX2SXMY
	 1AGfbXkZHKQcA==
Subject: Re: [PATCH net v5 3/5] net: qualcomm: rmnet: Fix MTU underflow and
 clamp to the maximum packet size
From: netdev-bot+sashiko@kernel.org
To: subash.a.kasiviswanathan@oss.qualcomm.com
Cc: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 07:04:03 +0000
Message-ID: <179524464341.3135.12597930189751385790@kernel.org>
In-Reply-To: <20261117060737.2764327-4-subash.a.kasiviswanathan@oss.qualcomm.com>
References: <20261117060737.2764327-4-subash.a.kasiviswanathan@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message gets the pre-patch behaviour wrong in three
  places.

Pre-existing issues:
- [Medium] At this patch, rmnet_vnd_newlink() sizes only the new device's
  MTU, using that request's data_format.

--

net: qualcomm: rmnet: Fix MTU underflow and clamp to the maximum packet size

This commit adds rmnet_vnd_target_mtu(). The helper rejects real device
MTUs below the egress headroom and clamps the result to
RMNET_MAX_PACKET_SIZE. It is used for new and existing rmnet devices, and
the same underflow check is added to the other MTU helpers in
rmnet_vnd.c.

> The MTU helpers subtract the egress headroom from the real device MTU
> using unsigned arithmetic. A real device MTU smaller than the headroom
> underflows and results in a huge target MTU instead of an error.

[Severity: Low]
Does this hold for the rmnet_vnd_newlink() path?

Before this patch, rmnet_vnd_newlink() passed the wrapped u32 value as
the int new_mtu parameter of rmnet_vnd_change_mtu_with_format():

	if (rmnet_vnd_change_mtu_with_format(rmnet_dev,
					     real_dev->mtu - headroom,
					     data_format)) {

As an int, the wrapped value is negative, so the existing "new_mtu < 0"
check already returned -EINVAL.

The underflow seems to have mattered in other places:

  - the ndo_change_mtu bound in rmnet_vnd_change_mtu_with_format(). On a
    tiny real device it accepted any MTU up to RMNET_MAX_PACKET_SIZE.
  - rmnet_vnd_validate_real_dev_mtu(). It let the real device MTU drop
    below the headroom.
  - rmnet_vnd_update_dev_mtu(). It accepted a data format whose headroom
    is larger than the real device MTU.

> Additionally, a real device with a jumbo MTU makes the creation of the
> first rmnet device fail since the unclamped value exceeds
> RMNET_MAX_PACKET_SIZE, while resizing an existing device clamps it.

Is "first" accurate here? Every rmnet_vnd_newlink() call seems to fail
while real_dev->mtu - headroom is above RMNET_MAX_PACKET_SIZE.

That includes a second device created after the real device MTU was
raised. The NETDEV_CHANGEMTU validation only rejects a shrink, so the
raise is allowed.

As for "clamps it", rmnet_vnd_update_dev_mtu() had no clamp before this
patch:

	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
		if (ep->egress_dev->mtu <= (real_dev->mtu - headroom))
			continue;

On a jumbo real device this condition is always true, so the function
does nothing. The patch doesn't change that. Existing MTUs are already at
most RMNET_MAX_PACKET_SIZE, so the loop still takes the continue.

This patch has a Fixes: tag. Could the commit message say more precisely
which paths were affected?

> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> index 984c66bee863a..2f3fefe58bce3 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c

[ ... ]

> @@ -336,11 +351,9 @@ int rmnet_vnd_newlink(u8 id, struct net_device *rmnet_dev,
>  
>  	priv->real_dev = real_dev;
>  
> -	headroom = rmnet_vnd_headroom(data_format);
> -
> -	if (rmnet_vnd_change_mtu_with_format(rmnet_dev,
> -					     real_dev->mtu - headroom,
> -					     data_format)) {
> +	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
> +	if (new_mtu < 0 ||
> +	    rmnet_vnd_change_mtu_with_format(rmnet_dev, new_mtu, data_format)) {
>  		NL_SET_ERR_MSG_MOD(extack, "Invalid MTU on real dev");
>  		return -EINVAL;
>  	}

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch.

Only the new device is sized here, using the data_format from this
request. rmnet_newlink() then overwrites the format for the whole port
and does not recheck the existing endpoints:

drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:rmnet_newlink() {
    ...
	hlist_add_head_rcu(&ep->hlnode, &port->muxed_ep[mux_id]);

	netdev_dbg(dev, "data format [0x%08X]\n", data_format);
	WRITE_ONCE(port->data_format, data_format);
    ...
}

Can existing endpoints then send frames larger than the real device
MTU? For example, on a real device with MTU 1500:

  - rmnet0 is created with the default format (headroom 4, MTU 1496).
  - rmnet1 is then created with RMNET_FLAGS_EGRESS_MAP_CKSUMV4 set
    (headroom 8).

After that, rmnet0 frames get the larger header, so a full-size rmnet0
frame comes out at 1504 bytes.

rmnet_changelink() covers this case. It calls rmnet_vnd_update_dev_mtu()
and restores old_data_format on failure. The newlink path does neither.

A later commit in the series, "net: qualcomm: rmnet: Publish data format
and mux_id only after the MTU update", appears to fix this. It calls
rmnet_vnd_update_dev_mtu(port, real_dev, data_format) from
rmnet_newlink() before publishing the format, and unwinds on failure.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117060737.2764327-1-subash.a.kasiviswanathan%40oss.qualcomm.com
