Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393929;
	b=nA4wE6GuZt0hm8hJin/ce+OscJMlsQTZzMx9h40/UxfeFc3xXD3Nx7zCNPC7a9oglE8l
	 HOASnLE2DGhPSPaGV0ysGGJbMKgL8f41SdjO+EKqSUYogdKfuUty9gbsCX9Eflps5a3ee
	 mZFESJrYKyStm3Kj9wn8G9DU0+G4XfTYiS1ZOC8cQCWkJNLzGgttm/z20Urd2vqz7NQF3
	 DABxapQHaYqU9ebV8lolWBJRVrNXyuZgvSUEWpJ2+zbvex1teeHGSDKZvySdEr3WhKdXF
	 /JQ+jZEKRwq0OQCWfDTpV3uflBfSvUe5i3NJXvVb7V/DlBaUjTmHhsT1hHC82WDwFVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393929;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rAhGsQ1MnLVChr0CNoSVsJhbgk0c6eQ9jQ62Ea3uw0Q=;
	b=SWz8aeWVMHetWBh98YVsKncx86GE7ahCRQsgbqBZnLfSv0XN+S+I2gE4bCz6TbteDQZi
	 w4EzzPeTIkVxKxPvzmiR0x0Go/3kE4aVKhHCmK0oob+RVcbQl2kXzfob80HweZjqk0WxC
	 VHWPaaYLEGakOzU5ObtbbJsASgMOZ0T5/ujkA5KfOu8XchZl3G1wnOXbxK4AA58UxxQff
	 v9Xw8WVN9fVkKUl6bgFrinfN2dm/6TPhxfeusfDTpnFf/gbx8VuJpcbFWoyXfD/C1v6NN
	 Yx3cvqOF7ArjdB+9RwhuBvdYUcSqsflIUD6eExXjSFntCJcpSj5Fnxyp/yDnyrl1Jmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onemJGGe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10F606A685;
	Mon, 23 Nov 2026 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onemJGGe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB41F000EE;
	Mon, 23 Nov 2026 00:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393929;
	bh=rAhGsQ1MnLVChr0CNoSVsJhbgk0c6eQ9jQ62Ea3uw0Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=onemJGGeL4FnweIrSmYZsT7K+MYH20qnEt2zpyC68YaSm5LakauXWZoKAxX/tBqmn
	 UzX85mD7hetSHEVZuF9eowEw1YORTRMc3kyx/1i72SIKrRF+dB0gRimIhyKPwY5822
	 VKSDd+2a0MQH6p+BI8NntpG77WzMiwu+M9zg5iRb8mA4HZtvfK+la3q2Y/MVWhcXeX
	 6lKwu9P4C/yBVmbeuJUAUDEhFjW+mNuuBJ+htpJcUW0XktGmw2RfU4ieLVQMS/jhyo
	 GGly5LgoFYDZORCqO/HEfcdIzeplPweT4+yvZj1QgBWbTnzW+15Cu2NgXsbwdESh/B
	 ExyZUkoGFZwLw==
Subject:
 Re: [PATCH net-next v3 4/6] enic: validate V2 VF configuration replies
From: netdev-bot+sashiko@kernel.org
To: satishkh@cisco.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com
Date: Mon, 23 Nov 2026 00:32:08 +0000
Message-ID: <179539392844.3135.623193821226744358@kernel.org>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-4-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-4-2cb25677aa8c@cisco.com>
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

- [Low] The patch changes how existing, non-configuration mailbox
  messages are handled, but the commit message only describes validating…
- [Low] enic_mbox_vf_handle_set_pkt_filter_reply() forces a reconnect for
  any errno-style ret_major, meaning one with bits outside…
- [Low] In drivers/net/ethernet/cisco/enic/enic.h the patch puts the
  forward declaration `struct enic_mac_addr;` between the existing…

--

enic: validate V2 VF configuration replies

This commit adds the VF-side V2 mailbox operations for adding and deleting
MAC filters and for setting packet filters. It also adds the
administrative-MAC protocol definitions. Reply framing, per-entry MAC
results and applied filter flags are validated. A new VF registration is
forced when a reply is malformed or the PF reports that the VF is no
longer registered.

> diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
> index 22a0ff71a43c6..28b24189d5bfc 100644
> --- a/drivers/net/ethernet/cisco/enic/enic.h
> +++ b/drivers/net/ethernet/cisco/enic/enic.h
> @@ -245,6 +245,8 @@ enum enic_admin_chan_state {
>  };
>  
>  /* Per-instance private data structure */
> +struct enic_mac_addr;
> +
>  struct enic {
>  	struct net_device *netdev;
>  	struct pci_dev *pdev;

[Severity: Low]
This isn't a bug, but the forward declaration now sits between the
"Per-instance private data structure" comment and struct enic. The comment
now appears to describe struct enic_mac_addr.

Could the declaration go above the comment instead?

[ ... ]

> diff --git a/drivers/net/ethernet/cisco/enic/enic_mbox.c b/drivers/net/ethernet/cisco/enic/enic_mbox.c
> index 85fed8beb347e..2326e00a4fea6 100644
> --- a/drivers/net/ethernet/cisco/enic/enic_mbox.c
> +++ b/drivers/net/ethernet/cisco/enic/enic_mbox.c

[ ... ]

> @@ -605,16 +680,166 @@ static void enic_mbox_vf_handle_reply(struct enic *enic, u8 reply_type,

[ ... ]

> +static void enic_mbox_vf_handle_set_pkt_filter_reply(struct enic *enic,
> +						     void *payload, u16 msg_len,
> +						     u64 msg_num)
> +{
> +	struct enic_mbox_vf_set_pkt_filter_reply_msg *reply = payload;
> +	enum enic_mbox_vf_reply_recovery recovery;
> +	u16 applied = 0;
> +	u16 ret_major = 0;
> +	u8 expected;
> +	int status;
> +
> +	if (msg_len < sizeof(*reply)) {
> +		status = enic_mbox_vf_classify_reply(true, 0, &recovery);
> +	} else {
> +		ret_major = le16_to_cpu(reply->reply.ret_major);
> +		status = enic_mbox_vf_classify_reply(false, ret_major,
> +						     &recovery);
> +		if (status && (ret_major & ~ENIC_MBOX_ERR_MASK))
> +			recovery = ENIC_MBOX_VF_REPLY_RECONNECT;
> +	}

[Severity: Low]
Why does an errno-style ret_major force a reconnect only for
SET_PKT_FILTER replies?

The comment in enic_mbox_vf_classify_reply() says:

    /* Some deployed peers return a negative errno in this 16-bit field.

That function treats such a value as a plain -EIO with recovery left at
ENIC_MBOX_VF_REPLY_OK. This applies to ADD_DEL_MAC replies in
enic_mbox_vf_handle_add_del_mac_reply() and to the capability, register
and unregister replies in enic_mbox_vf_handle_reply().

The commit message says reconnect is reserved for "malformed or
indeterminate replies". An errno-style rejection of SET_PKT_FILTER still
sets mbox_send_disabled and vf_rx_quarantined and schedules tx_hang_reset.
The protocol-defined MSG_NOT_SUPPORTED bit for the same rejection only
returns -EOPNOTSUPP.

Is this asymmetry intended? If so, could the code or the commit message
explain why an errno-style rejection is indeterminate here but not for a
MAC operation?

[ ... ]

> @@ -700,6 +925,34 @@ static bool enic_mbox_vf_payload_ok(struct enic *enic, u8 msg_type,
>  	return true;
>  }
>  
> +static void enic_mbox_vf_malformed_msg(struct enic *enic, u8 msg_type,
> +				       u64 msg_num)
> +{
> +	u8 expected;
> +
> +	switch (msg_type) {
> +	case ENIC_MBOX_PF_LINK_STATE_NOTIF:
> +	case ENIC_MBOX_PF_SET_ADMIN_MAC_NOTIF:
> +		enic_mbox_vf_require_reconnect(enic);
> +		return;
> +	case ENIC_MBOX_VF_CAPABILITY_REPLY:
> +	case ENIC_MBOX_VF_REGISTER_REPLY:
> +	case ENIC_MBOX_VF_UNREGISTER_REPLY:
> +	case ENIC_MBOX_VF_ADD_DEL_MAC_REPLY:
> +	case ENIC_MBOX_VF_SET_PKT_FILTER_REPLY:
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (!enic_mbox_vf_reply_claim(enic, msg_type, msg_num, &expected))
> +		return;
> +	enic_mbox_vf_mark_reconnect_locked(enic, false);
> +	WRITE_ONCE(enic->mbox_reply_status, -EIO);
> +	enic_mbox_vf_reply_complete(enic);
> +	enic_mbox_vf_kick_recovery(enic);
> +}

[Severity: Low]
Should the commit message mention that this also changes how existing,
non-configuration messages are handled? It only says:

    If a reply is malformed or contradictory, or the PF reports that the
    VF is no longer registered, the VF can no longer trust that its state
    matches the PF.

A PF_LINK_STATE_NOTIF with a short payload used to be dropped when
enic_mbox_vf_payload_ok() failed. It is a notification, not a reply, but
it now goes through enic_mbox_vf_malformed_msg() and
enic_mbox_vf_require_reconnect(). That sets mbox_send_disabled and
vf_rx_quarantined and schedules tx_hang_reset.

Short CAPABILITY, REGISTER and UNREGISTER replies used to be dropped too,
and the waiter would time out. The same is true of any PF message whose
msg_len fails the new check in enic_mbox_recv_handler(). These are now
claimed, completed with -EIO, and a reconnect is forced.

enic_mbox_vf_handle_reply() also sends ret_major through
enic_mbox_vf_classify_reply() now. A VF_NOT_REGISTERED bit on any of the
three existing replies clears vf_registered and schedules a reset.

The return values seen by the existing callers change as well:

    enic_mbox_vf_capability_check(): -EIO instead of -EOPNOTSUPP for a
    GENERIC rejection

    enic_mbox_vf_register() / enic_mbox_vf_unregister(): -EIO,
    -EOPNOTSUPP or -ENODEV instead of -ENODEV or -EACCES

Could these behaviour changes be described in the commit message?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c%40cisco.com
