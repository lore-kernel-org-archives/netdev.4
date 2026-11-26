Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718562;
	b=3XaIGzAYSHC9ftvcJ15zrxKAIA17JMBEQOVmmIPZX4Zhm/VNY6eaVr1GfjonK5LEh0fe
	 /cpWLgdATKUojtH77QokPi51ymxlFyRmghZKFloi04KoEdZpXKe63AjN889APiXW43JKc
	 8abkUTbLgVOpANWgONBE32WLkMz6S8X8cXWBjoxK6Sk1GU+n7u7N5jmZ/PmR1ikWGVFBO
	 UT+IuUdeGLOgNKzkpV++lEQnMZhOJfr297eS6Djw1NWZnkbaMrdgxDYrBVfn9Xvi8HIsj
	 z6w/OXlYrKhOibt/9xuFV3577e9M3Di6j5outNV12u/Jpskdgr7MIzInATOlNHICCvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718562;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=2DO4pSSh4TUCbknNkFq8VsF7RPgI+WiOGlgCP/3PmqKNWH0OxNZO3jC1qa1m0SUBYr3E
	 6ZroihYbgxh5Ogj9boGjmAFAm6gWzgfFoLD8MOyToOMR1jlP3erYpJNCpahPWmz7tt4oP
	 TtMLRHr/Rk0u1GFKN5cuSinuQ0cJ+aHeQ7Yfn8Sh1vwhz8zXP3Py6dayoefLf/COYsEw/
	 wmcXc4B14bCGOk9eEJXoficPWVTA2t73RKRiudfK8BSDOU9IrqVMlBoHl6UdytTcTyB2W
	 Fw5B2mc7+4kYbmlvfPtS59t6DjSO5u6evQQLDcadrMAvLC1Qzdst7kpmRAYJEpfeWlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSJV2yS5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C870606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C870606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSJV2yS5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfZRd78T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795718561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
	b=dSJV2yS5i5n4Y0qa8QpYgIlvjQkV6ztVeP14NykEmG4e8ZTbbOguUnFGnuZkgM1hfvob6r
	JsVpE2hnbjdJj2tNxhz/Zlwdqw/UfaoJiNIXP67HDDrgplpsiOxKUG+XGfh9aXwyPW8bpA
	cl83VPqy12HNsmZ2ziLdHqi20GJFVHs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-A7GVdXlrPNO2mtaaKS0-hg-1; Thu, 26 Nov 2026 18:42:38 +0000
X-MC-Unique: A7GVdXlrPNO2mtaaKS0-hg-1
X-Mimecast-MFC-AGG-ID: A7GVdXlrPNO2mtaaKS0-hg_1795718558
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92114c39cadso132578546d6.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718558; cv=none;
        d=google.com; s=arc-20260327;
        b=SQZKowY1QAuUNSzXKl+SisnhO8yQFIhcvg8DUE4sNPvM5/Y7b2KHjHbQwPvXdh97A3
         VeJh6asSmCc/BCLgJxeBgVP12/Z6pTdQbO6MzGvjwsEBUrVOHXqyQg8u4eTQwVUTAvtD
         MYdtB2QoHUCzN61V2MLBD2o1a4dURFaYDg/xyziA1r8267YnszPQDrWlYf+2M8/8UY+Y
         RtJI0R0OMv5eh6YAyKkG83hjFpTuN2a9+PcVXCsJenG96vEsPoBE6avjJoqWzlMPOPPF
         0kJXswbJuTWwY5Z5pSwbjRblG1DAlsuwW6EqzdsGx28bSAvItX90Q+a0I1QDQMkVNvYN
         +t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        fh=ihXDY6Wc35pMFUkgAi08HvbpmK98ArdnX0HwH4878/8=;
        b=HtRDRoraCAOGfiQYftVkA7JHLoF7KMZez+XlGVWsp0/OdGTuy/kEzI3h0WBpTsKzfV
         w91BUTnLNOBMyaO9qPFcrrAW+sS64nOLmzWoY7AVw6Zkxh1wPqRYFMnzVczJc3Q72ze/
         dWXznsbH9/YbBNNxLcoEPrEub/skTbh/AoqZBVAOmKA7D7w3Cx4wtaBhszRHJFjPP7r7
         efuf8Fkfag8PyuXvEHu4UHCccDTdW6ZSX/yoFbc+9tOrA0KFqQyYbi+2E0/1khWxDbZI
         ZL3H4JlgtNODZSJqzr/NENbklVTR3RwdNTbXvJvwWT5W6neqolwOTKRxt2gwSopfZL3F
         8D+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795718558; x=1796323358; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=AfZRd78Tl2My6cFNYn6J2IoXlWU7jd9dGbwrI6sPcEv8IbdB7fLO2XDTbfQrF+Io//
         ixsvT2itMWfRas0wyep77elrun0b0HGJrXml5mtbVm6K8dyKkh0KXNx0lrSGsPUkPCd+
         htlBpxymRJe/MctD8/s3oBLQrenF1llfpvNVhQu32t7LIWWg1Bh7H8nsKdn3e7FAE3vz
         mQxf/6gLyv6dziabFgdbxxM1bskyM7oKpN9JDuuuJ0aXwEDBLVIA3qoPxkSditthi7C9
         qBl0dW/paw/ir3LbJm8JTGe5BmEL00jx/ma8TFxiJ/0OxfY1hFMGLr2/eSwDP5uNRg0l
         WIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718558; x=1796323358;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbAhtOscc0IR1lviJrjyLzdj52UktyrxEKNHMTQqXwA=;
        b=yu1HXIslrHoTuiH8PlUKzhx91u9ZIF+SFyAsk6hOyK/yn9dTvpcJqeE3Yio19r7IXV
         pLl5tM/4icHezrFhP9PqaZ2HsNt8hQezjoGhigR4s9GohvXFAKq50fvKq92KFSY/7YGb
         ZoYiuwrgSwjlraaeYgDb0PADeioD/tznJrUQzK/V7xjCMYhN+aexu4WmpuZ1AlrkxIoh
         oDvY27oiBV2w4kMlYxlKG8seadgZp25aooXQvO9QhL7VV4LaDwDf9rehPxHyiTGcheHE
         GMP39HkCx+DBy6ZUVD3ihwhJso4JyeZeIDQXgunn9HlVh4uRrgXIfpYedO2q6KzsPVET
         HbGQ==
X-Forwarded-Encrypted: i=1; AL+hErEQWWuYrIDuoc28dQpzZhNE12bcmwvS6bMoB+TLk1uXnYUyqkm9f36vMBudWgyOUa/K+kmI9tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XsMk+WpTKKgvo7VB7oMOmwjfU33/vm8pFAqAXCU8So97MB6CF
	+korKtKHF9dGrGV1R81pyMe7rXs5RvtFHR4qVNfjTJydhhRXWh/6fm9f5IKO1w7ZSTIXkoWlLF+
	zX+TUKDWtsvf9xkobnRtFGno0Zff7jgZCloJqa4Ua/+3/dLY9VJqOCElNveCNNS4xz5RwQZ/fyT
	AZLRqTHV2NC2B1h9uqDNrpow+W0RBbCBuQ
X-Gm-Gg: AZFdTZePwTSukG8bn1hpB+6JTUtgCY5QCTs+UHcJ1JsATG+TvnVWK9wVAWmXNLOAGYq
	rxIgpeteNURT6lk45jBjJyc8F/tdSQxHM8LifetQAo966Bii5O2gjoBSh0HCd8tWaQKORP/SzeT
	oh7SpxLvfLCIQOuMfiHot+Tvrup8DXPzH0J3f4Ihe7bUN6f3x1os2pOJg=
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id 6a1803df08f44-9217c1a5a29mr99541866d6.14.1795718558232;
        Thu, 26 Nov 2026 10:42:38 -0800 (PST)
X-Received: by 2002:a05:6214:5701:b0:921:7c1a:5953 with SMTP id
 6a1803df08f44-9217c1a5a29mr99541386d6.14.1795718557797; Thu, 26 Nov 2026
 10:42:37 -0800 (PST)
Received: from 821463759402 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:42:36 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <awhAaTuR375RpyAE@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com> <awhAaTuR375RpyAE@sgarzare-redhat>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 10:42:36 -0800
X-Gm-Features: Aa3M54odw2FRTdRy2uflU_aL9ZEV5X35-hMgLihiDc4DudGmLOU2wiibEdItlhY
Message-ID: <CAAiTLFXT_Dqs8sUY+dL7KhXL=-QYudikb9kVFFRvGv9Ri7y7ow@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/8] vsock: add datagram support to virtio and vhost
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, Alexei Starovoitov <ast@kernel.org>, 
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
	linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Tue, Nov 24, 2026 at 01:20:18PM +0100, Sergio Lopez wrote:
>>This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
>>the existing AF_VSOCK API. It is intended for guest and host services
>>that exchange independent requests, responses, or events and need message
>>boundaries and sender addresses without a stream connection or application
>>framing.
>
> Thanks for restarting this work, I have finally found the time to took a
> quick look, sorry for the delay.
>
> Reading the cover letter, it is not clear to me the changes we are doing
> to the core and VMCI that was already supporting DGRAM. I'd like to
> understand better how the backward compatibility is handled and how VMCI
> behavior is preserved. Also reading commits, most of them just contains
> a description of what the code is doing, but they lack the reasons
> behind the changes (i.e. the why).
>
> Overall it seems the right direction, but I have some open questions
> (some of them discussed with Bobby, Stefan, and I at KVM Forum some
> weeks ago):
> - Can the virtio flow control be affected by a flood of dgrams ?
>    See https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-5720001
>    and virtio_vsock_pkt_info.reply / virtio_vsock_skb_reply(skb)
>    handling.
> - Did you test virtio transports when VMCI transport is also loaded?
>    That one is automatically loaded (for historical reasons) first time
>    AF_VSOCK socket is created, if af_vsock.ko is not loaded. So could be
>    a common scenario.
> - Any limitation of the current implementation that we will need to
>    fix/implement in next steps?
> - Any performance number?
>
>
> About patches, I started to review, but I hit a wall with patch 6. It's
> too big and really hard to review/maintain. Please split it (e.g. the
> refactoring for vsock_assign_transport can be moved out, etc.). Also
> there are too many if() with conditions duplicated and few comments on
> those conditions, for example:
>

I agree. I focused too much on quickly addressing Sashiko's feedback and
things went out of hand. I'll rework the series with a focus on
bisectability and readability.

Thanks for the review, Stefano!
Sergio.

