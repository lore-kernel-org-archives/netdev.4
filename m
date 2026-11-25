Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626717;
	b=jwPf4ZH/Ro5twNg+7lTHRv59zwA8cWjjrle9QGjC9z9WHeQslfBFN5QHHbjys3VgvE/7
	 KnVoP8vDcwWJxdFWlH5bTohjgL0nxVv/6bfZ3z9Q/nA2atGTQmPHJxqUBMkhGkI8nR2ML
	 5V6WDFcTyRyOuQFxXsQFMuwBygVd7IUSx3HGC+R/9eFkAzHFegJYq4fHuexGaaC/u7NvF
	 LEDzsyxBkYR+YfC+qDZNJOgW7KnXbyNu3Z1tADn489CM6Q9/7DwMIl0dts1B4rufwi1r8
	 PlvAYQIKeQQgLvzRr7FG6ONHheHcbOyo9Pn9nYXtNZiucUCcowrs54deBPOcyGCFk9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626717;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=wMnvi84iHgMT5EehQPUOpPHMSRil6iMt6kQQwsIp6L8=;
	b=llpqRWAkHijbb2WSI9XgtakhFshk+PZvEsn5zZOT+uumFFJQk/jKTCLdWhDQ9p7R4OSk
	 FCn4OcRkwAOabG/hXKTsgkmhOK2S+FLM8BaQMqG9jhgjR3qKjKDMizXLiPxH0gdabFh4z
	 Ho76CRgljI9z2X56Htwm4IWx64WG4Dd3Uq5oZmPshi7WAbcr6+ngkOiuBDTvjaqHsFyOc
	 TCRI1oXITan2YAbGMfST1/qFLO6L7gPZmssLDXXjuuh8rzSXun/QBizA4/aTJuMEUgx4V
	 +RdR4QyI35jOqsQTgXqHv4XhxVnFwttnpKJ0XA87UVwH6cbwiuySxq+5DylhRmngSLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gwt1iAHU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=D0wQeWAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC94606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC94606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gwt1iAHU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=D0wQeWAa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795626715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMnvi84iHgMT5EehQPUOpPHMSRil6iMt6kQQwsIp6L8=;
	b=Gwt1iAHUVMwCbOAfvitXOiEYwhojYbZJh0SyOxfUb5oytjeSTyvVWeA6ztn1EgRxVbooDN
	Fqv0zboUdkDdYLi050ws9Pq8lmndcCDT/6Z6LDfElXiPTynVViHflp3jAFqYMW0aIN6Ykb
	Zd2S6/0Ih4yzlLnQd81YDjRNwljUiks=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-vM0UZW76M9Gly5GsIkGxUg-1; Wed, 25 Nov 2026 17:11:53 +0000
X-MC-Unique: vM0UZW76M9Gly5GsIkGxUg-1
X-Mimecast-MFC-AGG-ID: vM0UZW76M9Gly5GsIkGxUg_1795626713
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67d98b79858so9806179d50.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626713; cv=none;
        d=google.com; s=arc-20260327;
        b=amP5jv31uyWglPV90HJHN98zb6twfld+wLRzQL9DyLocRReW/j9Vr/HlVv9cl7v21b
         z1Cqk6GrsSoQMCkBQEyk3O4T/msGiKxcrv3kZjd3fs2pzj6Va/onAki9//NRzFpD4++9
         SKnjTqkRB5N9VSVikF+FJGKjSgnfgM9c/CPuwqDYHeG9N3PQl+jY/mX1ZXdLdr5NiLZh
         dmYMbqNhjk9Iv67b49YEVjbKKDIO1XBi5MVNUH7NUfV/NAlKW6fRD+W1nFRWaDHqidT3
         /loWD42MaPDIybEUvFTDvr4UiWo8caebF2ZepJ6Zvf6Rp9BxePbzuUpLrXTRhsVe0iVW
         qjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=wMnvi84iHgMT5EehQPUOpPHMSRil6iMt6kQQwsIp6L8=;
        fh=4Z9NnDapjP00Hq4cle3qSOFsyTf6VLEorcF4yvHKNZQ=;
        b=hFvJFusEwj0hsq02IVapPc3jkmG/LKyl+y8bBIPN2JDTT4yp0lFMdgBdJR+fEuOK7Z
         48JpUUpBp/aTb7Zybn8eQtnNaG23Xx0eYfdPm1Y7S9v+oW4iIEyTqtjo2Uk+jLUWvquX
         fLPivtxrcajVgoSyIR9nbs9oH9nPShjG6ziytzALK8WcZsRMIhmg/JzLem9mryLsxxke
         iz+fkawW/RY88BrgFhRqzcPI8IkkxmKqs2/zn18lSHQCIVNeWjq6zFEzDTa5ytyovODX
         SPegc/0iT5cpHsSHeKH9q+OleSfxdT6zFm3Vm8CmU2E3WYCQwCrIQb+4BNd0oucnqKpS
         vTig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795626713; x=1796231513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMnvi84iHgMT5EehQPUOpPHMSRil6iMt6kQQwsIp6L8=;
        b=D0wQeWAaebB28+WKLQBSOH4C2jOFLLlSZTlO04f71qF0Aa+Kyyhryv/vMtWXYnbvuT
         k6iAnPClddwWtDpUDuQsaqXT9ZiPmBpetc/POaZJ4XLLpC7W8isgpVShvNq1LTzChtAg
         t0Tq0bZdciT7TRUz1dmRtlu0m94iT7c0k3eQ7hoUgxj+HLNXGhBSpPqGUSo+w38U25V7
         v1iAQAZYAd68wWaGlNRRBkdYB9MYjiJL8VkALML1ApACMyKKVRcChwhC2YrvvKf+Mk7I
         qqCSwS+qUy6ye4DZ1arJuofB1aNTR9ShOI+a0SSfz1P5Vdsg4MabmJ73nWu6B2XzZIaE
         MxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626713; x=1796231513;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMnvi84iHgMT5EehQPUOpPHMSRil6iMt6kQQwsIp6L8=;
        b=1PP51D2K+a/4pyPT59COwM0XnY69Y28pPMnrqyPvk5J6B/d6yOs/v98lC1Vs0NmNPW
         XUGba+Z+W8HarU9r3G/cQ2GXiU1SNlCYFx9Pcojc5rcfSq5QzRzTfkQe4CvbmiSVB7g6
         P4emdluY26Aq98U2jsK4Y9q0RXLH6p0kLVnMyAIgU6pYfrA2mzSreUjt8srngrArwilj
         PsyXGiBuwS/stoIH0Am/hSBQPeLC/Mf6wyYY0d0URYPfAkJyocx05GC85FlXJ3YD9MkB
         0MtsUNPDk6nrsL7qvLAHvnpGeTcfe3jdLieWLYuakDwn3+PbM1DUZPGlj3NfWPFgODFt
         0QGQ==
X-Forwarded-Encrypted: i=1; AL+hErG02T+o5XstdJlJ40iSBq/FP5Kaoexz4IIywO6sw/TKYSUu47RYbxDHflXJ//fHxUu77IHlBSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VQbwpDyCl4io6tq9UOf78BLBJfFNo5+XwdEOxvsG+nVeIitL2
	PnGwYbbSFHbvPNvX4ycsJFuQcrW71j6sGGFlGfuihBGwIhIXykB/qDz28fhrYvyQtnO5VeYkHU1
	KPgaDL4EUeYbjxxPR9ey4p2KX9n02crgQGrBkAs0L5IfPILE6r0lZzVZAfJC4bHuqkKzEBi5OMe
	B8a4Y082p9ldmzP07Zy2X9UvUOhXa2b33R
X-Gm-Gg: AZFdTZfabXQ40f66weIDx0vuKdCB8X1zpTE+4jRSl+aA73joz8XZMrfxEdb4qhIRfC2
	g8M8X7fnvwhGv+GaI1xq2uD71g5gBBWrLmcz3v3nipE/tVopaj1yGOhBMXDaYNW+86hDhjydr1h
	c8OaCoveCjQnh1Ju2RCX9LH1HjNDdB/DiRSzhuZDpWLINrh06rBGwVIfI=
X-Received: by 2002:a53:ca02:0:b0:67d:c2d1:5f40 with SMTP id 956f58d0204a3-67df44a9f94mr7458631d50.97.1795626712835;
        Wed, 25 Nov 2026 09:11:52 -0800 (PST)
X-Received: by 2002:a53:ca02:0:b0:67d:c2d1:5f40 with SMTP id
 956f58d0204a3-67df44a9f94mr7458599d50.97.1795626712243; Wed, 25 Nov 2026
 09:11:52 -0800 (PST)
Received: from 821463759402 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 09:11:51 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <aveRRt/rHQ1By6ul@devvm29614.prn0.facebook.com>
References: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
 <20261113-vsock-dgram-support-v3-7-1523c8e9b27e@redhat.com> <aveRRt/rHQ1By6ul@devvm29614.prn0.facebook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 09:11:51 -0800
X-Gm-Features: Aa3M54rWhP6JPS6dAHPhCuA1V9j2mDkBDAmNkK_cOM-iU_dy7BMJhibPYf3kF0A
Message-ID: <CAAiTLFWpoZu9ArNVQ_uq6RRQyiiQYvy5=uNVbhpb=6-OBJV8mQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 7/8] vsock: fragment datagrams across receive buffers
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bobby Eshleman <bobbyeshleman@meta.com> writes:

(I've just noticed I've missed replying to this review, sorry about that).

> On Fri, Nov 13, 2026 at 06:15:47PM +0100, Sergio Lopez wrote:
>> The guest already uses page-sized RX allocations. A datagram can exceed
>> one RX buffer. Growing every posted buffer to hold a full datagram would
>> increase virtqueue memory use and make small queued datagrams retain large
>> backing allocations. With delayed reads, a bounded receive queue could
>> then fill after only a few messages.
>>
>> Define START and EOM flags for datagram packets. Mark outgoing messages
>> with both flags, and let vhost split a message across guest RX buffers,
>> keeping START on the first fragment and EOM on the last. When a data
>> packet meets a descriptor with no payload space, vhost returns that
>> descriptor with zero used bytes. It drops datagrams but requeues stream
>> and seqpacket data for a later buffer.
>>
>> Reassemble consecutive fragments in the guest before tap or socket
>> delivery. Bound a partial message to 64 fragments and 64 KiB. Discard
>> incomplete messages on malformed packets, a new START, a peer mismatch,
>> an intervening non-datagram packet, or virtqueue teardown. Require complete
>> framing for host and loopback ingress.
>>
>> A QEMU reproducer now delivers a 9 KiB datagram as one message and all
>> 16 messages of a delayed-read burst. Paired host/guest selftests cover
>> 64 KiB messages and the burst through both a userspace backend and the
>> patched Linux vhost backend, with stream and seqpacket controls. A nested
>> vhost-vsock guest posting header-only RX buffers also passes stream and
>> seqpacket receive tests.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  drivers/vhost/vsock.c                   |  15 +++++
>>  include/uapi/linux/virtio_vsock.h       |   8 +++
>>  net/vmw_vsock/virtio_transport.c        | 115 ++++++++++++++++++++++++++++++--
>>  net/vmw_vsock/virtio_transport_common.c |  11 ++-
>>  4 files changed, 141 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>> index f4fb2ac732f5..1ff4a9aff907 100644
>> --- a/drivers/vhost/vsock.c
>> +++ b/drivers/vhost/vsock.c
>> @@ -185,6 +185,19 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>>  		 * buffer, we split it using multiple buffers.
>>  		 */
>>  		if (payload_len > iov_len - sizeof(*hdr)) {
>> +			if (iov_len == sizeof(*hdr)) {
>> +				/* Connected sockets must retry with the next buffer. */
>> +				if (le16_to_cpu(hdr->type) ==
>> +				    VIRTIO_VSOCK_TYPE_DGRAM)
>> +					kfree_skb(skb);
>> +				else
>> +					virtio_vsock_skb_queue_head(
>> +						&vsock->send_pkt_queue, skb);
>> +				vhost_add_used(vq, head, 0);
>> +				added = true;
>> +				continue;
>> +			}
>> +
>>  			payload_len = iov_len - sizeof(*hdr);
>>
>>  			/* As we are copying pieces of large packet's buffer to
>> @@ -244,6 +257,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>>  		 */
>>  		if (VIRTIO_VSOCK_SKB_CB(skb)->offset < skb->len) {
>>  			hdr->flags |= cpu_to_le32(flags_to_restore);
>> +			if (le16_to_cpu(hdr->type) == VIRTIO_VSOCK_TYPE_DGRAM)
>> +				hdr->flags &= ~cpu_to_le32(VIRTIO_VSOCK_DGRAM_START);
>>
>>  			/* We are queueing the same skb to handle
>>  			 * the remaining bytes, and we want to deliver it
>> diff --git a/include/uapi/linux/virtio_vsock.h b/include/uapi/linux/virtio_vsock.h
>> index 27b4b2b8bf13..e1937f756eeb 100644
>> --- a/include/uapi/linux/virtio_vsock.h
>> +++ b/include/uapi/linux/virtio_vsock.h
>> @@ -101,6 +101,14 @@ enum virtio_vsock_shutdown {
>>  enum virtio_vsock_rw {
>>  	VIRTIO_VSOCK_SEQ_EOM = 1,
>>  	VIRTIO_VSOCK_SEQ_EOR = 2,
>> +	/*
>> +	 * With VIRTIO_VSOCK_F_DGRAM, START marks the first RW packet of a
>> +	 * datagram and EOM marks the last. Both are set for a datagram that
>> +	 * fits in one packet. Fragments must be consecutive on the receive
>> +	 * virtqueue. Each packet's len is its fragment length.
>> +	 */
>> +	VIRTIO_VSOCK_DGRAM_EOM = VIRTIO_VSOCK_SEQ_EOM,
>> +	VIRTIO_VSOCK_DGRAM_START = 4,
>
> Should this be 4 if VIRTIO_VSOCK_DGRAM_EOM = VIRTIO_VSOCK_SEQ_EOM = 1?
> Seems like 3 is missing?

Yes, those are bitmasks. But they are also part of an enum, which is
weird and confusing. Perhaps I should prepend a patch removing the enum
and redefining those values in the form of "1U << 0"?

> Is VIRTIO_VSOCK_DGRAM_START strictly necessary? If we just received an
> EOM from a peer, then we know that the next pkt from that peer is also
> the start of a new dgram. We'd have to be careful to never abandon a
> datagram partway through, but for example I think we can just requeue
> the datagram fragment to later retry if we fail to place onto the vq?

Yeah, I thought about this quite a while too. Having START makes the
protocol less dependent on the transport semantics, allowing the guest
to identify an incomplete datagram to resume from a known boundary. I
think it makes the implementation more robust with a relatively small
cost.

Thanks!
Sergio.

