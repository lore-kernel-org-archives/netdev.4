Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713115;
	b=GT9GvGs71ma3xtXLDi7NA2iJkJUtgg5O/evFbJL7u7ki0C3gVnPq27PK23pBYo+DW0VZ
	 09JJ1gwO+JmVDW5QAMRNKaJRJ0BIk+C/AH23LiGYOIY9aCnNAcXmZ4cyFBHjJgWuNuSbV
	 DVIX1VtXF1wjprskIfZxDbrG6uDuhaT3qPdQk1J44WW3DNDyL3ct+ConwZgbnICBcKEk9
	 zRKacjTC+j9vBDSOVnozZdWMeBpMWdi+8mU2Ca+83qfZm8+4a1N/RXFx/41dcOfKsz3FQ
	 qIxwGvOCSvJLNUQGVTZ0XT5vKYBbctE85iF2QbgxBYzyjqSzZKP9c2AcxAjpkigiyTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713115;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zcsn+s07qIWSCH6CAt8hTslj76QVGyHgKy0O9c7o/Tg=;
	b=Gp4DwdCqjRpxL4MymutvqO9zOCJJXs39bo6XXzF727vouQsoCvOyB+mITpxmuPD5iwJn
	 v/Zz874z3EEqthoylFwGnXmo5k0AQGatYVwVB/CmBIgSWjEcu3W9gRu4J/VULglW94XAU
	 3QdNsk3E5byPQ5JFfuQidEH2ai59++3CbVcRKjIRVQFEdZW4ZJVYXi8Mo8LFUmUz3Q9Hs
	 sL1sBCORaC1hzQu6RgkCs+H1fyczkgtrkidkzco/SM/Bt/mCyNeWbmEJsNSRkUDfRlUP7
	 8o52tjrnLDaMmbl6SQXNt6Yq2tivojucxLcWFYbkx2+zSHDz9gdcdkYVi0LZ7tDHoKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWdAx69I;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ND0oRZ09;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECF1606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECF1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWdAx69I;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ND0oRZ09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795713114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcsn+s07qIWSCH6CAt8hTslj76QVGyHgKy0O9c7o/Tg=;
	b=TWdAx69IrYARhTQfZ2JmEinERFzAxF+LtOGWTRh+c/F34S6nk+zuEfj66aownViQk77h/e
	SY6q0w76eF0/H+X4bQo+D4/0ckOOrbs1iDtUCpMKb2RwL8DL61UWEV8Qu8gWnHqRsle6ST
	jkAyQ98lr/78engHuv017Az8iLc1yTc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-RMPzO_wPNsyvcxG7gmTbnQ-1; Thu, 26 Nov 2026 17:11:52 +0000
X-MC-Unique: RMPzO_wPNsyvcxG7gmTbnQ-1
X-Mimecast-MFC-AGG-ID: RMPzO_wPNsyvcxG7gmTbnQ_1795713111
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so3221169f8f.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795713111; x=1796317911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zcsn+s07qIWSCH6CAt8hTslj76QVGyHgKy0O9c7o/Tg=;
        b=ND0oRZ09iH5VKNjM3Z3yyODiZusaAt8XXxuQQf8PiLp5ogqthdgeNVANplxk/nlF4o
         aVsEb3p84X1XCz3LfZSRhBCxKc9kpukv42t9cdHKDwN89tLsx56zTXDsmP2cnGL6aEHR
         /qG8+5BGufnymkYXWCUp9J/UwrCauibFEpGEZzaHdU3azyOtC42/SViP1Oa04tei2jZ2
         roggv/8yqSdduW7sek3QGfzFz8bzdGIhAatYFRTB3WX4lNSLI+TFRLDSkXZlarDlWi3u
         PFb6hbl5v+f7kTexRbIcv3RMn/eV+G1swqknZVWSVM7G+5Pp02olXpyoxtAfq8GnaAdN
         1mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713111; x=1796317911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zcsn+s07qIWSCH6CAt8hTslj76QVGyHgKy0O9c7o/Tg=;
        b=Cms27gcNaHekD4CrkWTdtdQk/C22OCSftm4PGnlh3sfw4oAuWopsE1NtvffYH5lc6Z
         EV+lLr2e2y3yifzzZP8vqxTsiMRVF0ErC7Wg0jqwHsq0hsYjKC6ZAm26JJXNhcis3P1Q
         rlz/rb+3zxVt8r+jO6/ISwkk2gDtoyThN/0oEiYr1YhZAHjIEk56ue2kUboThMkGXtFD
         C5ZMUkElK+yUZyomBE1H7Wv4Bg0K+85UC/W69YFuRyrHJYJv2waH6MFa282qMpBgdYbI
         iQq7wglCEf9ivLq19BgdXiPCPyR7+XRfMBPqe9lvh3unr9kFlDjzL8SDP71KlOa9QKEV
         ryoQ==
X-Forwarded-Encrypted: i=1; AL+hErGDKqXCVYsm43CThiTzgtqsAvMvKcGB5Xrfpa5JzgUzqSNUC4NT4BZSenqau7kcAECDYH+rcSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gu3cavcYZ/L9Fwi/hbq1YC1newZnbIl7HoNsMKno7hHT/h5TF
	3cJEwEOQlMs/uf/gnXWP0J1Zk+fWYMDkZ8JAedF9B/rqCTCKd6D5V7XBI9cnUZaiuM/bK6VJ6kh
	+2cFWnExxoaCHOF6BVN0uWiqpyQVykzbJKRpT03mTW7HRoHiBWWT8R1Tg9w==
X-Gm-Gg: AZFdTZetHagRNK+87+Dtw0m7+UYl8jUmFZly/6ErDDzKM8nFVAWLs2DZU0o7xTLrqyU
	1AlOiPAbuoHO9/pOBTTss0MBdd9wcWmYhgR7qVhn/D9+Phfpe10ZLYjKrVC9xDqf+mXBIX9qnbR
	/SlHmhM+JsPoS6I0VhMnItULbftcz0cAlAIm8HjiP1OiymsYk4S7qmsteAME3h8MbxOW5a6kL+m
	PUK/vx42RYjeCwchsgWmcYY71oFhzo2gglNp4xr8ynlwG8OLZd+CotVw3/BAaG+3uZ8UWPUrvd2
	TWM2ZCTQ06QgNe3bYYJ1R78wnIgb+NF0bauwFuz+0j6iFE9MqGEXYmEhinebg3ScuMdG4e6LsMv
	WyDGCvKgmUDOob7gao4wD6zrTv84ND8La+bPoFKenP6mdca4wM4Ayww==
X-Received: by 2002:a05:6000:186b:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4abab02c60amr43563859f8f.5.1795713110930;
        Thu, 26 Nov 2026 09:11:50 -0800 (PST)
X-Received: by 2002:a05:6000:186b:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4abab02c60amr43563788f8f.5.1795713110359;
        Thu, 26 Nov 2026 09:11:50 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39482837f8f.34.2026.11.26.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:11:48 -0800 (PST)
Date: Thu, 26 Nov 2026 18:11:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v4 2/8] vsock: report datagram receive and send queue
 state
Message-ID: <awhnykxnmbUH3tlG@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
 <20261124-vsock-dgram-support-v4-2-3607484e85e8@redhat.com>
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
In-Reply-To: <20261124-vsock-dgram-support-v4-2-3607484e85e8@redhat.com>

On Tue, Nov 24, 2026 at 01:20:20PM +0100, Sergio Lopez wrote:
>Datagram receive queues hold whole messages, and transports may charge
>queued datagrams to the socket send buffer. Report the size of the
>next datagram payload for SIOCINQ under the receive-queue lock, so

Why only the size of the next datagram?

>concurrent recvmsg() cannot free the skb during the query. Let
>transports override the length calculation to exclude headers such as
>VMCI's.
>
>Report datagram write readiness only while the send buffer has space.
>Set the asynchronous no-space flag when it is full so freeing pending
>send buffers can wake poll waiters.
>
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
> include/net/af_vsock.h         |  2 ++
> net/vmw_vsock/af_vsock.c       | 32 ++++++++++++++++++++++++--------
> net/vmw_vsock/vmci_transport.c |  9 +++++++++
> 3 files changed, 35 insertions(+), 8 deletions(-)
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index ac061115ed30..e4fbea3b0e46 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -124,6 +124,8 @@ struct vsock_transport {
> 	int (*dgram_enqueue)(struct vsock_sock *, struct sockaddr_vm *,
> 			     struct msghdr *, size_t len);
> 	bool (*dgram_allow)(struct vsock_sock *vsk, u32 cid, u32 port);
>+	/* Optional payload length override, called with the receive queue locked. */
>+	size_t (*dgram_payload_len)(const struct sk_buff *skb);

I was trying to figure out how it was implemented for virtio with the 
entire series applied to see if it's just a constant, and thus avoid a 
callback, but I noticed that it's removed afterward. What's the point of 
adding it in this patch and removing it right after?

Thanks,
Stefano

>
> 	/* STREAM. */
> 	/* TODO: stream_bind() */
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index d5cf240d4ece..8a271eb66860 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1359,16 +1359,20 @@ static __poll_t vsock_poll(struct file *file, struct socket *sock,
> 		mask |= vsock_poll_shutdown(sk, peer_shutdown);
>
> 		/* For datagram sockets we can read if there is something in
>-		 * the queue and write as long as the socket isn't shutdown for
>-		 * sending.
>+		 * the queue and write if the send buffer has space and the
>+		 * socket isn't shutdown for sending.
> 		 */
> 		if (!skb_queue_empty_lockless(&sk->sk_receive_queue) ||
> 		    (sk->sk_shutdown & RCV_SHUTDOWN)) {
> 			mask |= EPOLLIN | EPOLLRDNORM;
> 		}
>
>-		if (!(sk->sk_shutdown & SEND_SHUTDOWN))
>-			mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
>+		if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
>+			if (sock_writeable(sk))
>+				mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
>+			else
>+				sk_set_bit(SOCKWQ_ASYNC_NOSPACE, sk);
>+		}
>
> 	} else if (sock_type_connectible(sk->sk_type)) {
> 		const struct vsock_transport *transport;
>@@ -1632,10 +1636,22 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
> 			break;
> 		}
>
>-		n_bytes = vsock_stream_has_data(vsk);
>-		if (n_bytes < 0) {
>-			ret = n_bytes;
>-			break;
>+		if (sk->sk_type == SOCK_DGRAM) {
>+			struct sk_buff *skb;
>+
>+			spin_lock_bh(&sk->sk_receive_queue.lock);
>+			skb = skb_peek(&sk->sk_receive_queue);
>+			if (skb && vsk->transport->dgram_payload_len)
>+				n_bytes = vsk->transport->dgram_payload_len(skb);
>+			else
>+				n_bytes = skb ? skb->len : 0;
>+			spin_unlock_bh(&sk->sk_receive_queue.lock);
>+		} else {
>+			n_bytes = vsock_stream_has_data(vsk);
>+			if (n_bytes < 0) {
>+				ret = n_bytes;
>+				break;
>+			}
> 		}
> 		ret = put_user(n_bytes, arg);
> 		break;
>diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>index 1f186e8f8364..2b9493e987d1 100644
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -1761,6 +1761,14 @@ static int vmci_transport_dgram_enqueue(
> 	return err - sizeof(*dg);
> }
>
>+static size_t vmci_transport_dgram_payload_len(const struct sk_buff *skb)
>+{
>+	if (skb->len < sizeof(struct vmci_datagram))
>+		return 0;
>+
>+	return skb->len - sizeof(struct vmci_datagram);
>+}
>+
> static int vmci_transport_dgram_dequeue(struct vsock_sock *vsk,
> 					struct msghdr *msg, size_t len,
> 					int flags)
>@@ -2075,6 +2083,7 @@ static struct vsock_transport vmci_transport = {
> 	.connect = vmci_transport_connect,
> 	.dgram_bind = vmci_transport_dgram_bind,
> 	.dgram_dequeue = vmci_transport_dgram_dequeue,
>+	.dgram_payload_len = vmci_transport_dgram_payload_len,
> 	.dgram_enqueue = vmci_transport_dgram_enqueue,
> 	.dgram_allow = vmci_transport_dgram_allow,
> 	.stream_dequeue = vmci_transport_stream_dequeue,
>
>-- 
>2.56.0
>
