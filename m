Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730963;
	b=dhUO2TfiiwD0W4lUf4rZMeSIYnTJYvACdoBbxQFJJOBYw6VbmAo2/YtUPNb0qp5wxFb6
	 c9sznYrLR3A3cyW7kVPivuTRwkdSXr04QF1w5iFNd6mRf9uL7uhKn6zB/E903t7l5fRe+
	 33P96fpeJXbTp1H1kHSMepFBMNj9fIpoGfG92nlKPZLFOU0AX7SdBa01erXHIA/luAh3A
	 MJJHE7Am6YW01KB4hHqyo6ZoOVlxHwbJuJ1EOn8qP0xXpzqHKYJSMNtGYyenYD9yB3MVq
	 W021ZGDf8Yl+A8sEyYEaF3AitOJTOpDQfVP4kqaNgZPVRMady4PtVQ0PZusSdikNgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730963;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
	b=E00gJ7MmHBwD0TBGr/DjXYsPxTQXmCqlFfeqsn+oL/VX7h3EHF7auq6LMkWh7sz9UV2P
	 OXkO8QvJ6k10LWxk1godV0zJGYk/CVr05hV5eovjd4mqugGby7ZSoaoreso2J+Z9yKND7
	 /nWLlT6W3CIPxEeRTLiQxaMG2YlDZ2p3kFm10PWc3/NwUmlHTtA3efCUbtASX8re2Z2N1
	 scZ+mjAVkR6VbMbgX02257afMwSTLXllaYqhyKTJ0s7h7H/MCIe9ly5SZ0V0JpAWtZ5gN
	 emkxN4vl+H+sxAdw43dtbVlUs11vlpcjDoZnlQPsJU7GfCXG7MwWoJJShTriDFy0WBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="U1ZJ/qw4";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DmTM11z2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC756606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC756606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1ZJ/qw4;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DmTM11z2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794730961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
	b=U1ZJ/qw4M7mVztCrKbqJdmcZa2mWB3lDxcYPV6VksfpVHeovY+w2uh8+jFOrIhphcDyKZb
	k+FgeWZeGhSXt53IV1BdLzTa8f7xV5Ev5AbP2yhvULuV2w+ebFPB5BwNci/mcJmorJ6CW+
	KzLPdEme3yDV9ZUynergdfb3V09GWng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-6A8D2YpENhqP2MA4f2bkOA-1; Sun, 15 Nov 2026 03:22:39 -0500
X-MC-Unique: 6A8D2YpENhqP2MA4f2bkOA-1
X-Mimecast-MFC-AGG-ID: 6A8D2YpENhqP2MA4f2bkOA_1794730958
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso3294265e9.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794730958; x=1795335758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
        b=DmTM11z2mj0Ygyj+SNk4FmJDtfZr0mpv1PUS2jGNBIKf8NMHOQcQqCCVH78jJnYr8w
         BcLd6CjxdqglHGwJ5zLoZ2EH+AXT5DksN/YWmNfMWshEiGPfB5wbL3ur3RXMt+eak/bo
         AJU3htHY47nwfMp58dD7JeMtvLCU83xjPwW+zQGwNZUK53OG10JeUWhK4dqc4phQswdW
         Ar/lr9h7EaYwautyYFc1ZvinugH7pbRkEDJxsZ/bXqOBotJbEZcAGAiALRAhePW6TbLY
         iL0iS/8I5xz+qWtOxPYrgduXx37RHZ69MBAqu39Tu6g0e1g5xBYYkd11SclSGtv3Hsdb
         8IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794730958; x=1795335758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOqx9PI7nO87s05epf/KxKW2rSgtDSMLjv2nLVv2RsY=;
        b=eKaghwgrjEznar3Mu4PihjaLUEHH3DfA5yNMO3e2JCyseCxXNKcBQEz7PTg/vTIOWW
         Nxk128JAK8JVEtDdFRdKUPZ/73DQXQaNTWLYvhqw2L8QTwQNnX1JbKqLhuodCKTNhsI6
         jZc164GS2k+3EXOUMhJpnnnuJp9jOTnCQuIR9M/xMU7t7NpEh2jCIBpYzJL9a5AiCC30
         jBRuLeGCpY7M2a6GNH3xuxx9j2HM2Vufk3Obv5yWSNI9SnUpTAhyhtm0oOqBbK/qdNgO
         fCwFGZYB3Ld6VafQhKtufTGgiDHzOE0nqKzvbkj6vyXjMng9Xl7gzjWBXY/WuoK13hNH
         ROMQ==
X-Forwarded-Encrypted: i=1; AL+hErFb0+ufugQAXmBz7kXvtVlgbE4ZwadgWv+M414Ei7OfO4p5lAwL0/DDnNGSAFT3dwJngx8j9Oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ax2xBk6AOYRTPnuJekFdgNavBzB/Wdl9QZrd7Rwyg1H4DeEje
	dGoDqRi6keHlJeeAUG9va4HjalRAaBzuZiLqICRAtXDfWYPTPdZfk8VtMwWnMfDHYYFqIRhPPnX
	zcU/TGQIial7pBoq3J4QD3dppvbmGU20Wv8qF2eUwOBvA8so2ccCrfCHtaQ==
X-Gm-Gg: AYBFou3pO1nbdmNYS1iJ6l/NoeyGabguPb0ma8XI9zMoBQQmQY6GImQHGlxLHHEPAwH
	H8pAOCNbOLpyuBmvEPO5mc888MDlTmcCjNQd9MC4a7a1hqNKlfZWvMIS6LEouq0XL1njCwgKWZE
	E3tRRbsICxQ6r1j8ugvdGrYjHgE8jTpAYoW5nuHBoMaEuqGgoZIqr+sFPuEcTZiA0mBfi+m5LQD
	HMArQdas9jSzAWw62ZRuClkMARlYn31rDDd4Z2chCXR1QBhIrAxU0CWVWTZXRKS7t61WEN1gjng
	Rq/+QuDI9b5/yLcaXIhrmnoPmXrNftG0pZGtyS75gYPlpERiRrMERjPHjHYYd5+2S2NNZQ0hHSJ
	0IOuUULVIYf6cp0Wi4NqMJuW1kWBmNHzzfNu6mwmCTsJQlamEwqz2kA==
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr155906555e9.34.1794730958281;
        Sun, 15 Nov 2026 00:22:38 -0800 (PST)
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr155906215e9.34.1794730957813;
        Sun, 15 Nov 2026 00:22:37 -0800 (PST)
Received: from sgarzare-redhat ([193.207.75.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm297980195e9.15.2026.11.15.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:22:36 -0800 (PST)
Date: Sun, 15 Nov 2026 09:22:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vsock/vmci: reject datagram binds in local network
 namespaces
Message-ID: <avlpwYZr4pSpunEl@sgarzare-redhat>
References: <20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com>

On Fri, Nov 13, 2026 at 06:04:40PM +0100, Sergio Lopez wrote:
>VMCI already rejects datagram sends from local network namespaces, but a
>datagram bind still creates a receive handle in VMCI's global port space.
>A VMCI sender outside the namespace can therefore deliver to the local
>socket. Its handle also prevents a global-namespace socket from binding
>the same port.
>
>Reject VMCI datagram binds in local namespaces. No namespace-local
>datagram transport exists, so EOPNOTSUPP reflects the available receive
>paths. The receive callback also rejects any local-mode socket as a
>defensive check.
>
>In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
>delivery and the global port collision before the fix. After the fix,
>local bind returns EOPNOTSUPP, the global bind succeeds, and a global
>VMCI datagram still reaches the global socket.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
> net/vmw_vsock/vmci_transport.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/net/vmw_vsock/vmci_transport.c 
>b/net/vmw_vsock/vmci_transport.c
>index 1f186e8f8364..282131544c42 100644
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -627,6 +627,8 @@ static int vmci_transport_recv_dgram_cb(void *data, struct vmci_datagram *dg)
> 	 * outside of the create and destruct socket functions.
> 	 */
> 	vsk = vsock_sk(sk);
>+	if (!vsock_net_mode_global(vsk))
>+		return VMCI_ERROR_NO_ACCESS;
> 	if (!vmci_transport_allow_dgram(vsk, dg->src.context))

Why duplicating the VMCI_ERROR_NO_ACCESS return? Can we just put them in 
OR ?

The rest LGTM, if you respin, maybe we should mention that also 
connect() and sendmsg() are affected since they call vsock_auto_bind().

@Bryan, @Vishnu PTAL.

Thanks,
Stefano

> 		return VMCI_ERROR_NO_ACCESS;
>
>@@ -1697,6 +1699,10 @@ static int vmci_transport_dgram_bind(struct vsock_sock *vsk,
> 	u32 flags;
> 	int err;
>
>+	/* VMCI handles are global and cannot serve local namespaces. */
>+	if (!vsock_net_mode_global(vsk))
>+		return -EOPNOTSUPP;
>+
> 	/* VMCI will select a resource ID for us if we provide
> 	 * VMCI_INVALID_ID.
> 	 */
>
>---
>base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
>change-id: 20261113-vsock-vmci-netns-isolation-7e46732dcd73
>
>Best regards,
>-- 
>Sergio Lopez <slp@redhat.com>
>

