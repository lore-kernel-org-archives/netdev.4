Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101428;
	b=zWnxE6/z2T4VMxZ9ku/EqcdJ6AxRgzpNxMvxZrTS3H+RH7gUXGbOCJlMXbh0uEClcX/t
	 zfN6oijWCwNlbFzZK+cFwmJYpQlM44q9bDukRV3SAKQkWgZvA7qyp9Gqw992YGAZIdiiw
	 K91p2/Ra9wSQmHfGq2rNxL7i/TRVv4iZj/ACHEBQtqczTuIH57l4VWujIk0+mnJ7LWH1U
	 CqHjvWrlM98oqxqsRtCccWf63xEqEUHhjTY9n6XWerDy7Jv1j2Jvge8zDuYeoRfDAzLbh
	 2UnTK/cRmJSaguiVSldlzuCGo5T313kQgD+CQoD8JyhastH0kq/K230Uz41PyIjtiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101428;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
	b=Fc+O6lGJN42Unx8gqqIE9jWegRH2tK56TAXi7wZ+COiZigKjyTGu2vuMjMZ6WkAw2TKr
	 JTDVyoCNjbo2d+ZMddtUIXkjyeb+HmX9KjONgZ8RYIwHVBQZHG2mCrHeUftZef3PEnw3s
	 QnIs4t15lo+KGkWtVRupd94uJr7i9FdpGpT3U83qiDlLiaAEBrZgGSuz/TV06QR82yFGn
	 9EtgH8kxB/FUYR7aWxJgqXWUOubgTLkWZPCS4zyWDivGglP860BimduIyTZbEMTckyvIl
	 AQ7cfpckBPHPQCddvt1H7wtwiYN8b9568jUsmCygNQpH9nrvTbCFwPgoXbgQBtA7Ayw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bFvsnCza;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IUWlH+K9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE6606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CE6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bFvsnCza;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IUWlH+K9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795101426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
	b=bFvsnCzaLt0i4kQ4a0tYtrxyy0+DDgjpwjmenzhaLBHUVv3OG8uqP6hWP50fpgN8HxYTvA
	SUdlH4cfmk9xJzunPgIWmGZEHxVH+3dqdtDZbhEaPrX4RtaO99Rr08ZvHyTiju+5NCavKO
	TBfuAHSYS4DBMUUiC5OsD73WBqvX9s0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-OCnJLgzGPUW86yXAYNw_Mg-1; Thu, 19 Nov 2026 10:17:05 -0500
X-MC-Unique: OCnJLgzGPUW86yXAYNw_Mg-1
X-Mimecast-MFC-AGG-ID: OCnJLgzGPUW86yXAYNw_Mg_1795101424
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so20384405e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795101424; x=1795706224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
        b=IUWlH+K9m4dAZ99xhZkMm66CDHfQQpuhK7inqhjwnJcph+H/r0YQE344/dAseahaMS
         xUjhHtovxFHAbvYsihdu8qXKez2hpG6v+4aOTHwuhTegH05gJgXbn8kjYS6MKVj3ZoS8
         n3YcE4lPOSF42mi5t6CjZsP4wiSSQJ7fObtAkqUSFrPdXyzGiQLdx1Zn2hyBAdUYsz9X
         nVAP1yu/Fl+CTeIZj0s8c1wpBdyLGkTR/A6x4e1sLPbFU4hSj2VHSaU2C5IKq16z/lJn
         sax/k0MDQBGfyXmTRfvh2qTzUjoGVbPov6Eh1dBsUD6sRi744WwcCdVTchlClgU9uNFV
         S3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101424; x=1795706224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
        b=Ao8wnXJYYdeFJZC0HA1t7g54yydlIObJz/SBg2V9a8EFJt2gYRba7vctLllldy+NKL
         Z7Om7nWzO8z1uplwvl7UdxphxyaQ+hbJjTymDVbLnKtwNdlVxWLkKyc/y19pird+eOrl
         i5pw308FC8J0Va6+rlIvfCNswVl3nMpboEADHODQACL47wJ6CY+AF/0h1t/XBqF6g9s6
         WX9JEgvBj0zSAd8EQQF/3q9jKzOFwd0UOJ+Ps5RPho0zsYJskZauwDIe9thV9eREorAV
         ZyJTwizXDhMHMwjXCD/7zT5Om6ERut3YIrS5jftKFM50oNMBgO9nT8EfzYaju0eEj5Sp
         F5LQ==
X-Forwarded-Encrypted: i=1; AL+hErFXpUmVwkd/L6/Dv8ZgxFynLb0+/ZzRVzijGjZb3sutgvwQAFM089y8pzykqs7K0V41x25CGyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EhdO2F0Aj/40j5zys5yZ1M9+dPkZoIpjc2idPdQUQtyW72GtG
	ypSDl4ILUCPErGrrxp0STljjswd4el7pVxt3p03rFW6PMSPo0UsJOHTH+KKscfT8NlAG/nc0X77
	jgxpe0/jaRmFzbgr0OBIITpfIl4C3LW+KIXQkN2FJs1ZkOjr80++Jpp4FJw==
X-Gm-Gg: AYBFou35p28Rq5Gy7kQoqF9dA9M0Ja62PIexzgLcVe9r1nG3FSXIyAOuOwfCg3c0Y+J
	a7W7kIv6KwO1nFcULZcpKpgQytw9XcSxdokd88fIi9x+338653rRJ3StjLxcDMkO+lR6dYA/FAS
	hBZIv5vPBhDVinmklWynUXm8n3WuCKtFlMz8609JfhvzP+S0WJK09afEHXKtrJd4w67vYumYy76
	iAJnLkK1I9B96UyggtvUwY3mdVDyLIsk4nhHHaicFuWi940mNhr4wEYsXAzzKAauuYfVEmMuLsg
	03mrX9fcWgILbgksvlnacDnGKrgsspzOfKgpyLq6PRvyJ9AKiAgki92UG0YLQy/p2RNCLIeliN5
	gzTmKkKX+LS16O34GkLTIipJpUWekhQuKZB5MvlFxqw==
X-Received: by 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr133918255e9.19.1795101423919;
        Thu, 19 Nov 2026 07:17:03 -0800 (PST)
X-Received: by 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr133917645e9.19.1795101423444;
        Thu, 19 Nov 2026 07:17:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e47177sm29776395e9.2.2026.11.19.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:17:02 -0800 (PST)
Date: Thu, 19 Nov 2026 10:16:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: raoxu <raoxu@uniontech.com>
Cc: jasowangio@gmail.com, eperezma@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost/net: Fix receive queue test in busy poll
Message-ID: <20261119101645-mutt-send-email-mst@kernel.org>
References: <005FA5F7354482C7+20261110051642.249640-1-raoxu@uniontech.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005FA5F7354482C7+20261110051642.249640-1-raoxu@uniontech.com>

On Tue, Nov 10, 2026 at 01:16:42PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> sock_has_rx_data() returns a positive result when receive data is
> available. Socket implementations with a peek_len() callback follow
> that convention, but the fallback for sockets without one returns
> skb_queue_empty(), which has the opposite meaning.
> 
> This makes busy polling stop when a raw packet socket has no queued data
> and fail to recognize queued data through the fallback path. Return the
> negated queue-empty result so the fallback matches the callback and its
> callers.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>


do u want to send v2 addressing review?

> ---
>  drivers/vhost/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 4570a4ffbab2..10ed2d55ff07 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -538,7 +538,7 @@ static int sock_has_rx_data(struct socket *sock)
>  	if (sock->ops->peek_len)
>  		return sock->ops->peek_len(sock);
> 
> -	return skb_queue_empty(&sock->sk->sk_receive_queue);
> +	return !skb_queue_empty(&sock->sk->sk_receive_queue);
>  }
> 
>  static void vhost_net_busy_poll_try_queue(struct vhost_net *net,
> --
> 2.50.1

