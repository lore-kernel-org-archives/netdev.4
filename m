Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132189;
	b=e5kbte2okTmsnpZq9Jbdf1lPMGqAdPy7l0IMi+8QwusP8JXC77WXUGQaieYZHSA7FO2u
	 lAY8+/TiPJJDBZ/AxCZ88rI30s5VoIvtmJMLWEi/awFdCJEMxq+FOt4580AQNMpLbaMRo
	 Pa+VmOec162yrqoir2QPXUdUEeQG4LyFIPxjkvDq9ft9quSXBtZTUUP6VwkypivIWrDur
	 8hkqGaxZaEC5iGZHk1D+NxhOuIn1Wxb/NYkLHVSUIm9hFSocIe+86u3dFItUDTm/+MYyh
	 sK+gWR8XNO1oLytFY24zUKbJja7dmqjG4BGRZJXNdAF4eC7t0KS03GVvd9s0O5WvjEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8pxF1XjPmydG2nmBhgUZ39yA7PK/1cXjwAWpQkhvRAQ=;
	b=dWyNNCtnfVzQBq30XnyJR0WnDPPlPZvwAW6eKCmHz/sGPeHJ1Y9B1RlGlHEqPA38xaos
	 2CqCw8PrulMyMceI81qrtJ2VtuyND4LiCsJAxZryYG5b/OhuaaeXqClMzR5DkVq+PM3nE
	 RLXGFcWJogqe/H90ccV46sgfLzyWeiGqepXwbenw0pSM5t37iqWv6yxBIxS8/SuCXk2DY
	 LMnLMgLMY8dMEkC94z8eHXnfvYu79HIBc8ixTnNnZ9YljQ2JI2VQ956soVadD3Yc8U3J9
	 2baVlIBaBxfadD8qrGxSyAICh4uolxuPuggWTvipCBfGVPasw9O+HIbtR/q2Fb5DgFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WjRmHavG;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD57606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD57606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WjRmHavG
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-77bf892b496so126584137.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795132188; x=1795736988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8pxF1XjPmydG2nmBhgUZ39yA7PK/1cXjwAWpQkhvRAQ=;
        b=WjRmHavGc1axqWZ/NY0RuQD48lhYaCkSwdQqA2C5NLcw4M4NlhxBwnCfqcRS6+ddzM
         0fLFbVfOrjyIIyBbdPLCVG1fL9wToVC9/zJZf+DEKVBbwbsFBL+OUPnrfFSV0tfGX0NL
         EpHq6kKsFPohP6yjEYQh2q28tyqBBesVy72WbOHBy3t+CehEKmBq+tiZXHU5Ga1pOcnH
         suRePIAOIrvoWPiAx/3cLtPHECgr7AioI0DsXLD9IfFFi+4i9QV6d3girZeBhyNIPFFk
         8hoaCl8d0H7iatKCkw1b/mMuIj6WEVAy8qPRb4Pa9k/d2nDUi6HeMsCDGTGHxEkE4MyJ
         BETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132188; x=1795736988;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8pxF1XjPmydG2nmBhgUZ39yA7PK/1cXjwAWpQkhvRAQ=;
        b=iqQ/t8egIBk3NqwG3mr5QgkN1j0ZMA/SD6+PzuWWgoXcSgal+lFdBvW0UdKqd3R9dK
         JMi4e9G5XAPhI+OaJlxWIUfmPXSh1k0rgnyZ5/ErSQrv5wDfEzmob7Jw4C5s99O4KZ79
         Jl0N8uxUlQC43aqylLD8lNnYjmeh8+IIeV+em/ftvPnOSHqAq9ggPfA6/7GGkwbUrUij
         0E0EPSTfPlmE55W1RMgiTdPjF+MYDt5tt6NWrkzS4abjIWtsdKFR3iRIoUc8ge6gJ7UI
         6q+VTsGEKLfrGBiNICOAsvyriICF5KBuR2NWMz/LV6LDWRJQlXW/KcfMcJv3RdZL9DHh
         ZD/Q==
X-Forwarded-Encrypted: i=1; AL+hErHcKLrI3R7t8M5sPBNT6rH5gjskZVoApAoYPeIRfjEdzDte0Zb9fgB+dUiPeKnKjGHQQUB5wdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MM/2zquMpvA7e4WVl/0RdV7OR2VsNRLE/kHEmZR3Vmr/7e6NE
	AcMgPzIKYhdxmMD2IF+Gxt2AJygZRPRu04xG0VdykeJFVaBzf/ZG/gBR
X-Gm-Gg: AYBFou18rd/38gDUg0lPPMPoRfwmen+5wOU4uyqi7RagarKTbtGigZAzogBt//18PV2
	kWqfOXPMp6X7ois1CRhjFFeFSoncSDVP4YH2ADyDgEMnUNS628oycmk97f6EFtlyQCq4HROrWqo
	hA1zXDrf9N9cngt3H0EKxiJGx3qfcJ2tOhFF4Ch13ccQRFUpm6eWWOuGtPLTNx12qusOlneqIWA
	AvKYQyEJ26DScWd2M9qN6DKfeN8K3supxaIuH2wFkcJexosEf+e13js8E9481pjubSRxzYeF1RS
	GB0AenNgShuk8cKbSgV6n9LXPZ8ydrkBRNHWYRLb4Kc8Z02p6kUIb5wVmajne0645rhYRgFU+Vv
	y3bxyn+fIChkXT2Bp2jBmxBlOpc5mfpDv9W4KUiaZo5HWiYUA+X6YxTfOWQpEbciY6Cayb9Ne33
	xET0UOvvY+4Wtw9EZYpJAeLEfTnPIt9FmgaBoPK2LIQ8RSFtyfvXFIRhMVZLJ9YxDMyuSHDT2kE
	6jCO6DwRkHxgPy7+oOIEwb0gZLtG5o3bk+Us059sIYkep+cnJDMVX/Ikrlhfdro/4NJnymyHKa2
	K/vwtdhEXFaS3ZeBES8nGL3kpRQilFXrYH39+sLA4x2xLCGFH/jK5/FVr6QZhh8+Xg+bHbdVOoG
	76dI8E4NGhDkTK3rOU0+fhgoQL/t9RPEojRUXaNt8UPdsRHbxj+DmjX2lIv2l33A=
X-Received: by 2002:a05:6102:41a3:b0:7d2:754c:23e7 with SMTP id ada2fe7eead31-7d7396d1b09mr430676137.35.1795132187626;
        Thu, 19 Nov 2026 15:49:47 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm1376086241.10.2026.11.19.15.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:49:47 -0800 (PST)
Date: Thu, 19 Nov 2026 18:49:46 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>
Message-ID: <willemdebruijn.kernel.320d89ebe1495@gmail.com>
In-Reply-To: <20261119072258.3157902-3-edumazet@kernel.org>
References: <20261119072258.3157902-1-edumazet@kernel.org>
 <20261119072258.3157902-3-edumazet@kernel.org>
Subject: Re: [PATCH net-next 2/4] tap: add a mutex to protect queue management
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eric Dumazet wrote:
> The list of queues attached to a tap device (tap->taps[],
> tap->queue_list, tap->numvtaps, tap->numqueues) and the back pointer
> from each queue (q->tap, q->enabled, q->queue_index) are all private
> to tap, but are protected by RTNL.
> 
> Add tap->lock, a per-device mutex nesting inside RTNL, and hold it in
> every function reading or changing this state: tap_open(),
> tap_put_queue(), the TUNSETQUEUE ioctl, tap_del_queues() and
> tap_queue_resize(). A mutex is needed because tap_open() and
> tap_queue_resize() allocate ptr_ring storage with GFP_KERNEL.
> 
> Add tap->ring_size, the ptr_ring size shared by all the queues of a
> device. It is updated under the mutex when tap_queue_resize() succeeds
> and is used by tap_open() instead of dev->tx_queue_len. Once RTNL is
> gone, tap_open() can thus not size a new ring from a tx_queue_len
> which is being changed, or rolled back by netif_change_tx_queue_len()
> after a failure.
> 
> tap_handle_frame() reads tap->numvtaps locklessly, add the missing
> WRITE_ONCE() annotations while touching these lines.
> 
> The mutex is initialized in the macvtap and ipvtap ->setup() handlers
> and destroyed from dev->priv_destructor, once all references to the
> device are gone. macvtap has to chain to the macvlan destructor,
> export macvlan_dev_free() for this purpose.
> 
> Set tap->dev before the netdevice is registered instead of after,
> since the char device can be opened as soon as the NETDEV_REGISTER
> notifier has run. Like the mutex itself this has no effect yet: RTNL
> is still held by all callers, and is removed from the paths that do
> not need it in the following patch.
> 
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> diff --git a/include/linux/if_tap.h b/include/linux/if_tap.h
> index e9c4c9272585cdb14cf0ea7ea7d96acc3e8964b7..f2507fd41b9c9bf37687d17d06a2a9821b934b50 100644
> --- a/include/linux/if_tap.h
> +++ b/include/linux/if_tap.h
> @@ -35,12 +35,22 @@ struct tap_queue;
>  struct tap_dev {
>  	struct net_device	*dev;
>  	u16			flags;
> +	/* Protects taps[], queue_list, numvtaps, numqueues, ring_size, dead,
> +	 * and the tap, enabled and queue_index fields of the attached queues.
> +	 * Nests inside RTNL.
> +	 */
> +	struct mutex		lock;

It's very helpful that the exact fields guarded by the lock are explicitly
listed.

(not a blocker) could this use even more mechanically verifiable
instrumentation, such as __guarded_by field annotations and __must_hold
for helper functions that access these fields?

It is not possible for every such example, as e.g., lockless READ_ONCE
numvtaps.
