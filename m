Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685154;
	b=wXa/Kt+aqg2U0qVZ+WE3RaHmzdG4iuz4stBvklOQccLibo6fGz/iE4P4b6OgDeIHZnYk
	 gOLcKvxr4RpyrEKKb9htslxS3xaUYrUFPQtdYHTfnR5X+FFhojaL0YyVB8nHWf/Tx0EFe
	 RLHqvZOy/6+NxQmEsGefVYcKEnWveFeznMt1K280i/WXY1VWWdVuhhjgmNrHlH5Yjyv/z
	 TMOZtiwX27U86Kb0TBniBi/dmQwuB8XUEqCHDhYsPuTqts3dPO/IVJJkoXDhbMhUdyQg2
	 2ryluZvfr6nKVpcGpu5sbg4WtmgskGYFlZ/nyag2y4KCQ8qnVrkceF8lw4mwPZ0eCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685154;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
	b=ZyrmYt9+lm3mckNHoA1LOq/JgQlBUgC/MYcHqscMTmrPpaoZwJSmLpZAOZobJglIPd/7
	 q9wytPeWexKZ9LvlMnM1hA0WFOKojkW16jkeU1cLKCBPuUQ5OntQ7KgPoH7ELuvO58tYR
	 lPADOT1ndx06Eo6VCTMciv/X1qkp7ghy6Q9odEjJDTa8YAZ+3gXxD6WjG4dVmE+Hr5do5
	 PQh5NU7GGX/+7HnHvAVg+CZE3atlZq+1cbhe1uQhyUPQlj6JOPC7W9etYkI6xRUy5zGVi
	 Zr0EUhiOUqjcZg9YeLgC1FGwMMzzOVZIaxwSNcMH9YAW9NjLMpKpdafebx9pflOL8jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQjJIA0q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0DQWVhR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6249606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6249606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQjJIA0q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0DQWVhR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795685152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
	b=EQjJIA0qgg9kzPnXlRXrbhuQ2TDh99Hzq1ZfNV/e5hcoPfT79xqhn2Hi8r0ZUaBTBN4qda
	M3WQDMaeKzpzfKRF0X/bRQwygAxJf7YC2T6GaH+2MtyBQ8MB9tlqv977dSBEWBQDoEPQ7V
	QPMXtihoapCxQbRhFJvsQg/bEP1j8yU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-xbIov6QeMVSkauFKUNOFyw-1; Thu, 26 Nov 2026 09:25:50 +0000
X-MC-Unique: xbIov6QeMVSkauFKUNOFyw-1
X-Mimecast-MFC-AGG-ID: xbIov6QeMVSkauFKUNOFyw_1795685149
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso47857355e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795685149; x=1796289949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
        b=B0DQWVhRZ/jvEiWnXpaC1SnUOb5W0IaAtvMuz/ToupBUsoqIzK0Sn8dX2v4/SzO7bZ
         MY6FQMjBdz23ruklE2uSrRmCKvwYfLUWePuca39GIB/V3xloCicRtgaLyRrrTbtVcq5d
         C/PnVLhuZ52+cy6/5ETNDkjAMxZAivqQBa4DS1QXO13Zyg/yEpkqDNXGxRS9BHqEoVS7
         1xivqX48Blo3kqAyfTiYt0MwY4pUt4U8+ezxgxEEFGuqlxdo9BtN50FGJOpGIBhjAZRv
         4p6KVcTvYXBfnTvHcmCp2qSyeGXpzzn1673U+lQ1Noh6W67CNA3KpT5CN+NVmYmOv9nu
         +YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685149; x=1796289949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfvcaCnRXo7+ZO7tgrpqUCFteTLmrLXFEjj9APedgl0=;
        b=IGtOZrasraY9Vz/idP3asvGAaNo6PiMyTuxVow/27QyXZxodNMAxEaH7NynqR63jzw
         ysp+ouJFiZ7E3p9oLxJ4j+H60mMpqI6k+lyXTJIkCqyr8gD7ychDltRCq63NtHUzR//k
         4zOWPBlyyUK4udSusElgVUlsTPXzZFIyrdvmCHL7v+Ut+sPm/205E1P4WjT152z/YMvB
         745c3ePsZaagA/QOIp5AbqPCUeGTwdEvLC+wkyqpDzaHt+BO+kWFroQMn5vheWL3TCMv
         dXjVKWIfPztS8vwjlSl49cPEh+JkTYT9kacg6VzyUapl03IMKArq8nwHeLdU1cu46KDR
         pd7w==
X-Forwarded-Encrypted: i=1; AL+hErEjrCw5C5dr2M0SHU8FnWc8BNIGiznQx9Mf3X4joa8Crhigemed4/zHKBCklybKoF+UyJIgk6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mS2MGBZs0MBI97cpDXbfcp1jugn5gMeKH/d/pQ3Mfg5P2JVuX
	LZ/rpPYpR8oyKIBUP5NCp9sZ+rUv6qCAOhvxwbvDYoD+Qg9n7BU2NODq28UNV2KFCxkUOETtW10
	vLtxnQRvFOaA7OvXWSSlA07PRFtGfnORFNO9Py8JalY3jlESjPeVnksMsvIpTKWATvA==
X-Gm-Gg: AZFdTZcmN632GVl+18AnchCFyTPsuzufF+d+K7WodrLRcQ+pIBCkUF992MdzhiDmFN5
	6Ry4JGh3edRN7I/AQ34XZWde2oQwlT+7/mTdmqcCi3AoifaYWoEGBlNAhFLclxMS4AU7X3UdkoT
	WU6nhhyPwZCk17kajq63XilKlehvVHQkpXiaT0ayl8pzTN7AWYkx+uBj1QBPBESwzCpDMXK4Pyz
	L1AnPgO9XkbEiwuz1vdyymbRh70g56XSMOSbpk/bnRQK37FuveJA0gh/2Q1YZJi7WGHjrYwhaTj
	M8thv2TbmCPvL+JTtmlnVSsmyXJANlGUcmab8GELIeY2qY4OsP+eYQ5GbtOeguM+QMND3tg3/x8
	HAsnOVB1Oq6ci9ZE6D7/f6T6QBNlm8ujmSzHFtASSKea8L1MapUa0oQ==
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr421920615e9.3.1795685149187;
        Thu, 26 Nov 2026 01:25:49 -0800 (PST)
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr421920085e9.3.1795685148578;
        Thu, 26 Nov 2026 01:25:48 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm41351930f8f.29.2026.11.26.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:25:47 -0800 (PST)
Date: Thu, 26 Nov 2026 10:25:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>, Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH net v2] vsock: only undo SS_CONNECTING when connect()
 fails
Message-ID: <awf5zJTrZcgvdpOi@sgarzare-redhat>
References: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>
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
In-Reply-To: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>

On Tue, Nov 17, 2026 at 05:34:09PM -0800, Bobby Eshleman wrote:
> vsock_connect() sleeps with the socket unlocked. Meanwhile the transport
> can complete the handshake, setting sock->state to SS_CONNECTED, and then
> reset the connection, e.g. in vhost_vsock_reset_orphans(),
> virtio_vsock_reset_sock() or vmci_transport_handle_detach(). When
> connect() gets the lock back, it finds sk_err set and moves the socket
> back to SS_UNCONNECTED. Userspace can then connect() the socket again,
> and a connect() to a CID on another transport makes
> vsock_assign_transport() release the transport the socket was connected
> on.
> 
> Only move the socket back to SS_UNCONNECTED if it is still
> SS_CONNECTING. A socket that got connected stays SS_CONNECTED, and
> another connect() fails with -EISCONN.
> 
> Likewise, only move sk_state to TCP_CLOSE if it is still TCP_SYN_SENT.
> Otherwise a second thread blocked in connect() on the same socket can
> time out after the first one failed and called listen(), and overwrite
> TCP_LISTEN.
> 
> Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
> Reported-by: Kyle Zeng <kylebot@openai.com>
> Link: 
> https://lore.kernel.org/netdev/20260909-vsock-connect-reset-closing-v1-1-50298b9ccfbf@rbox.co/
> Suggested-by: Michal Luczaj <mhal@rbox.co>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
> Changes in v2:
> - Only reset sk_state if it is still TCP_SYN_SENT, so a concurrent
>   connect() caller that times out late doesn't overwrite TCP_LISTEN
>   (Sashiko).
> - Drop Michal's Reviewed-by since the code changed.
> - Link to v1: https://lore.kernel.org/r/20261116-vsock-connect-close-v1-1-43fb125973dd@meta.com
> ---
>  net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 1d7d53542724..ce958b48295b 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -1704,6 +1704,19 @@ static void vsock_connect_timeout(struct work_struct *work)
>  	sock_put(sk);
>  }
>  
> +/* Avoid breaking the socket when another thread has changed its state while
> + * we were asleep.
> + */

Should we make this comment a bit more clear to explain why we are doing 
this?

Something like this (IIUC, please check and correct it)

/* Undo only the state this connect() attempt set. While we slept, the
 * transport may have connected and then reset the socket (it is still in
 * vsock_connected_table, so it must not go back to SS_UNCONNECTED), or
 * another thread may have turned it into a listener.
 */

The rest LGTM!

Thanks,
Stefano

> +static void vsock_connect_close(struct socket *sock)
> +{
> +	struct sock *sk = sock->sk;
> +
> +	if (sk->sk_state == TCP_SYN_SENT)
> +		sk->sk_state = TCP_CLOSE;
> +	if (sock->state == SS_CONNECTING)
> +		sock->state = SS_UNCONNECTED;
> +}
> +
>  static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  			 int addr_len, int flags)
>  {
> @@ -1862,8 +1875,7 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  			 * sk_state == TCP_SYN_SENT, which hereby we break.
>  			 * In such case VIRTIO_VSOCK_OP_RST will follow.
>  			 */
> -			sk->sk_state = TCP_CLOSE;
> -			sock->state = SS_UNCONNECTED;
> +			vsock_connect_close(sock);
>  
>  			/* Try to cancel VIRTIO_VSOCK_OP_REQUEST skb sent out by
>  			 * transport->connect().
> @@ -1877,10 +1889,8 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
>  	}
>  
>  	err = sock_error(sk);
> -	if (err) {
> -		sk->sk_state = TCP_CLOSE;
> -		sock->state = SS_UNCONNECTED;
> -	}
> +	if (err)
> +		vsock_connect_close(sock);
>  
>  out_wait:
>  	finish_wait(sk_sleep(sk), &wait);
> 
> ---
> base-commit: 533ec433efdc11196f438da90d683053a57257ff
> change-id: 20261116-vsock-connect-close-1beb7cb51e7a
> 
> Best regards,
> -- 
> Bobby Eshleman <bobbyeshleman@meta.com>
> 

