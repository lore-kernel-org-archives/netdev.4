Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450640;
	b=CSn236F58mbc9cMrsuRp5VhKb99Lo3MGzHo61sZc21LwIlHGgZ6koVuqxdC30cTMRKXf
	 /9SKLomEzQVdC84gXjDD4wNQmliG6oHNtMF4mltpeaPcRcoIIzZ+2ud1MbIKfUS+ddPTj
	 KYky1TepEPCsUK8fzmmHSnJYI6fi6xvt+hrzneEGZCkh9tqa2U25PIruTUpUXgBywgr96
	 V57+XxPWvsGkPOIcmWeb6vWqVeQHSNfS66pdzGnushAelIlSgC/AlZEPz4C5rMVmlshg5
	 Avykk/142Z5A7z7KicvarJDdNYjpM44oEPniRzPsp+r0UV9jOa2u+lqMT3Q4pQlI+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450640;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
	b=fIhuMfyDKg9F/lvKT1G1GeVbSX7Ueo8QipP2g38UdvvNIjJBF31uszdS570Q7ehGANX4
	 hLZEFEzmXBmruZBISGYH51RuAFLw60BMZs9C7WL6wL6Hycir42irzTATGqNnlIpeMZcvq
	 kIqwuiLO4VXqTASmF9RXDFhuezm/dhEIXouhTHtjo67jY2kmHLp4v2QPWp84K31CoqGVv
	 gU+9cdTQE96YPoGm3z65v1+Pt+shWjG1F9fXyDlznz9OdOvlNdMzac7ydbhXf85FLjAx2
	 PjnLmkagViN6MdNv1bTc3VaAJbJPcmHQdWrmETYUFLiH4KQxYWJ4BUrFQq2VkIkZ6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IPd1nB6Z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EFWjYSTs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AE606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IPd1nB6Z;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EFWjYSTs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795450638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
	b=IPd1nB6ZLVQPneWsEXFvVVQMx8was4lClAZCBRJ/L+sUBLyHeaHJ98E0y44GGj2IvD8Mam
	za2JsFaOFpufuJhaec8H2FOf+QS8CDWD6vLCgOC/WnmpZz0lMSflAG+Q6Annvq5f167pU8
	zvfRzKu0Apt8fzLRRPeMKIo2Gzy3Jw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-ewr5f-fQPVuNIy2p2FiH3Q-1; Mon, 23 Nov 2026 16:17:16 +0000
X-MC-Unique: ewr5f-fQPVuNIy2p2FiH3Q-1
X-Mimecast-MFC-AGG-ID: ewr5f-fQPVuNIy2p2FiH3Q_1795450635
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4aa0500c979so2162790f8f.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795450635; x=1796055435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
        b=EFWjYSTs6eZbKtZfTzVI20evhQuKBSbQFwBnL7ixe6pYNqb3IX5FdNJ1NXk12la/fo
         mtcq8GhB5fbnQhWtE3XAnfyxUDceh6nkUkIoCsejjiZ5xIUIo3D/lpZrrdqy6JZ1Uw13
         i8gGNOQfWASM9FbNeEqtG58xOZ0gLZR8bMdPEOX2aXVh5toHQitzAoqzO7HXU7XK/nni
         2yJbyWsuJtKRhA10Zs2K92JS5vL+KOQjUYEnkDWYjbNa0+6B+VTKq8E5pBfICJiVZpG4
         jYCFjpoDjxCISpe4VOF/NOPsukP9LGBo41m8ux/OAQcxreEp8Ej6xJTjSYH05IAQwH8/
         xjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450635; x=1796055435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GHb/SYd6gXinJYqxw1GDlcMLdqBI2V3zFyLkxFbZ0k=;
        b=RZosDsKY2uJjnDoFmuNTb6M4tovGbxtmALBYUF7/C8wUp+U0KlvwNVOi66f7sNlV1M
         oS31FzSEzC2dldk2irQ0H9fQNQO9oroNo7JwvkGViAkg+h5MjjWqi7ONZK6coTjtCifl
         ISUuhB31L74+OZ6JAVQizVo0WP4qdv/bqtg4JH5fVYTbJOb+3SgokQSRod+VqKOJlUo+
         ikIzVHaTxAjx7Q4nYofV2s7R9dk2Ji9W3xUswhahuA2AzMjlWblnESPcbuMGsWp4p/MV
         MNDovdHDbhsRSgG6CaYXiY8Bjr8Bwi3o350gquhSxpCARgT93rBPApJZ7KHaPY/c542t
         0npQ==
X-Forwarded-Encrypted: i=1; AL+hErGFa8vljD4Vo/FST8mWbrcyKXzcGoAtOf4KB3fWeeUzt0BT/lxkC8nevz5GpheyVU10dyicvw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aoN3RCQIV+dhkJSgXp/IqWMp3xDZfEqRIvwvz1jz01vn/CVvb
	ugKV5NJFvQ48rziLgrxv3i+heJpzo6RrtBAtQrwn81Y5nwb9VRTUFSzz9lrYVS93Cok1NBJtSYY
	jcsXO2B4Ev/cM85dD/e5Kt32JJqnANkTDJGQp/MqHMDCu9npamHDsyVXHrQ==
X-Gm-Gg: AZFdTZeCU4x5qXPMGZrPX5p8DUp0XTDFx8PZfIOutqAaLrrbjz4Hhnr5qpegAx3HODm
	AK6OpPD+5A1P27N+NTwimpegQcnntLdgQfcDvqbfd9792UTwuW3YgYYS9NXymmGt8sbn7GXxOyh
	G5mdqPd18OzQbFNgZI9kdSKnEQiRatHIQkDVxXnUiXIJOkIb0ceAKBk8WP71lPlpPPf3iT8yhEi
	Z9owOGoVe3zv9N0En0XCFtzoUfrnIN0aeLfgP44TA5NUMGXqfb/mugJg3aaWkYkoZJ1dtBHWcNu
	ov10YUetJZ2NBQoxmWGDyTo2O4npL6WjwjRzG/dghMK/CLRx8YTPHKH/p+kmHRD2MRiGYRs6q6Z
	jMUCZ2NLJqp2owZ5w67zWzrHkcQOOvbbDxFYTQms=
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb88808263mr270420285e9.14.1795450634791;
        Mon, 23 Nov 2026 08:17:14 -0800 (PST)
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb88808263mr270419595e9.14.1795450634202;
        Mon, 23 Nov 2026 08:17:14 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm209571105e9.4.2026.11.23.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:17:13 -0800 (PST)
Date: Mon, 23 Nov 2026 17:17:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v6 1/2] vsock/bpf: fix zero-length, MSG_OOB and
 MSG_ERRQUEUE reads
Message-ID: <awRlwL1epH1j61Z7@sgarzare-redhat>
References: <20261114-kbh3-1-022-fix-v2-v6-0-96b6029bbffa@eldare.de>
 <20261114-kbh3-1-022-fix-v2-v6-1-96b6029bbffa@eldare.de>
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
In-Reply-To: <20261114-kbh3-1-022-fix-v2-v6-1-96b6029bbffa@eldare.de>

On Sat, Nov 14, 2026 at 12:59:14PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>On a vsock socket in a sockmap, vsock_bpf_recvmsg() sends zero-length,
>MSG_OOB and MSG_ERRQUEUE reads down the sockmap path whenever the psock
>queue has data or nothing is queued at all. That path copies from the
>psock queue and waits for data, and it handles none of these reads:
>
> - a zero-length read with data in the psock queue spins with the
>   socket lock held, and the delivery worker blocks on that lock;
> - MSG_ERRQUEUE consumes stream bytes from the psock queue, and the
>   zero-length MSG_ERRQUEUE read that MSG_ZEROCOPY users make to collect
>   completions gets -EAGAIN or blocks instead of reading the error
>   queue;
> - MSG_OOB consumes ordinary stream bytes or waits for data, where a
>   connected native socket returns -EOPNOTSUPP.
>
>Hand these reads to __vsock_recvmsg(), the path of a socket outside a
>sockmap, which does not wait for any of them. They now take one path,
>so the order of the checks no longer matters.
>
>The MSG_ERRQUEUE case was found with the help of Anthropic's Claude,
>its stream-byte and MSG_ZEROCOPY parts by Stefano, and the zero-length
>and MSG_OOB cases by the netdev Sashiko reviews. Each was reproduced in
>a VM with a vsock-loopback socket in a sockmap, without kernel changes
>or error injection. With this patch alone they behave as on a native
>socket. The vsock vmtest.sh single-VM tests and the BPF sockmap
>selftests pass with the series; I did not run them on this patch alone.

nit: IMO talking about series/patch is confusing while reading when the 
patches will be applied.

>
>Fixes: 634f1a7110b4 ("vsock: support sockmap")
>Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
> net/vmw_vsock/vsock_bpf.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
>index 9049d2648646..c9b399f37720 100644
>--- a/net/vmw_vsock/vsock_bpf.c
>+++ b/net/vmw_vsock/vsock_bpf.c
>@@ -80,6 +80,9 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
> 	struct vsock_sock *vsk;
> 	int copied;
>

nit: a brief comment here with the reason would be nice

>+	if (unlikely(!len || (flags & (MSG_OOB | MSG_ERRQUEUE))))
>+		return __vsock_recvmsg(sk, msg, len, flags);
>+
> 	psock = sk_psock_get(sk);
> 	if (unlikely(!psock))
> 		return __vsock_recvmsg(sk, msg, len, flags);
>
>-- 
>2.56.0
>
>

Code LGTM, if you have to respin, maybe you can improve a bit more.

Acked-by: Stefano Garzarella <sgarzare@redhat.com>


