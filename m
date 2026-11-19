Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104411;
	b=5R/4Xvx8oWBllRLJ0hryYAcc9EedkjkvcQ3cF0f0J6i4l/wjOLKnY768AT3tTtLvVzSZ
	 dJ36RMNJtrMPiVRfWyFgGGRghARjWGFPx7YoS4j3amB8jdLT2+NictIlbx6tKeOUqLoCr
	 XSUbN2N0fTTbDntjocWfyh1zip+SGB1rfGrh+BllVGRHSrP4GmJRBZ7bAMi+bovoUn/5I
	 SdH5fYEePTjManSHcitlh3SLKoBYFnVvSD/PIh9HLpecKBahuEdIzMyUlhvZa0W/scVVA
	 TRZpaICh56iW8LmmO288C12le67a4HKUZV9JfpbeER+GPtU5C6Q/LoX4B7Ws3FwOhgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104411;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Dd1gd3HFQQdIECo6gd2+bO3Oskz1749IshHJlKLQ034=;
	b=D63v+GcG7vg9k00+LWOG8uDoOsWjsKWZZjBfdV2wcGVJmRYMKnVP5jfrYunYBAaRnwtu
	 U/lJResnf/9C/OwMN8osqklFb0Krlqn65uBlFo+q7mZNbITp8BrmGly5BXYgSbnB37ANH
	 WHLMpOnoNAYxBFzS/fLpGaR82vsv9ZafXjegKtj/NV1wJr+uRGrkj5QbWl4WzIUNfvfxJ
	 I1+3l+svbHeP/slT5c0g+KeL09I1fhvd2dvS7hLfZS83tyy89M8ydqQDdfrPQR7rDJiag
	 qtfEuZTnTj24CUxCxNsQBmLulV19HOFyGQ6FZVE9mX4eOn/6+HcB0AcQs43NXCHFbgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8CEMoSa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gjLDKr8h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1E606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W8CEMoSa;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gjLDKr8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795104409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dd1gd3HFQQdIECo6gd2+bO3Oskz1749IshHJlKLQ034=;
	b=W8CEMoSac/0OF0pYX2XaCXRvcDGZD+yWCUZA2HbdGCelxrDDaek8N/5pd7eSgtXw+bamE4
	Ybb7eF6j18shepnMchytmXlAyvG+g8JQS0lNg3CmVcUpA8eGVmS+EALfr6s5sigs3114fq
	UagJUL9N6mABZqYI/IGRYS4P7NuZZ/w=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-a7VUGFThNvGAS2VSmDNivA-1; Thu, 19 Nov 2026 11:06:47 -0500
X-MC-Unique: a7VUGFThNvGAS2VSmDNivA-1
X-Mimecast-MFC-AGG-ID: a7VUGFThNvGAS2VSmDNivA_1795104407
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2c7a903a1so1378627137.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795104407; cv=none;
        d=google.com; s=arc-20260327;
        b=YfWwFreIOMl9rPKzelcFt4NwfgewPVwaS4xxIktFNvLJzKS78oaAv4gSjvtsaMpOjw
         1lAqix9dZYMSd7q1mnF5bA/P9+lj9sLb1Q6Ts8YJls6abwnpLZ7BBYuN5AgtmbwJECBy
         j2928sLLuxVSYRNkOxil2Nj8SGR/f18SIcFJ++9pk6XwCqaoMWBsrhcDekDebhif5VQR
         uTmM6Uvbp5Zsc9CKLT/Al80zNOe0A5yK2avYfZh4xN2P403lBDoVaYyyeZZ9tOpepMaC
         wv5BcCnNNTfhnBj9TbMdFT+IUsYWPJJhrGSPCCD2R+ROY/D9sXQ70xkQSIiLZL43s2Kb
         ki+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Dd1gd3HFQQdIECo6gd2+bO3Oskz1749IshHJlKLQ034=;
        fh=2eMvm2Z5dPr++tDfKdA4ZcZRhyOMtT0t5z5Vvu+0YbE=;
        b=WdBWyQ5skjZddFp+TUC7IkrvqGUzW2KTGM1rTXyxV99e4R7yd6a/VGHnf/KcySyme8
         TC8R3X1JBneRqwhVIwjFX9SnyBAMBLFZj1Hm7OOKRL4NWZzh5+jlp2+FcapaN7Ss4uqQ
         zs4DuBodPWgKP/6dUZ3+7hnn3EN4Z0CAqbR9fucgHWTIlhNbK2yB0K4gmBniMULZq2dV
         wzsVImIGchf13NlfnHZW6hGQhy8e+6rpPzWiEjAEzO+5zSjb7l5irh+YqZhUOt+6Djgr
         xmF8kmTGd9pjSy8lkSDrObbQyVhazzSYzfD3efdxWtdceg9ddejnDpG0okc847USoCC2
         t4nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795104407; x=1795709207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dd1gd3HFQQdIECo6gd2+bO3Oskz1749IshHJlKLQ034=;
        b=gjLDKr8hS7NLNh4huyL7wrkffOFLh8hxDFSyRzdwJD5xQ+6vWndL0j3ZD9bBqCBLRK
         nfd+N+AITPG9weZOVZuHk17IoYJuAaqje+MSDtXXhTHNvyc7eDcPr4yaH4ErJ1o38DzE
         yf814ZyY9wgH0kCuMoxco6MS/GXtwtoFpIjaZe98j8M59+bZHJQnjGnqpQe7BBdQxnoJ
         27T0pu268PwVTr9y/q/TvBXxgUQSksYIXKrHDsKFYbQKu5r6jON1JwX8go9/t1rAS9Pz
         PKQ2b8/72YcfNswgyX3mSo51BrK4HOjkR8peOZLhkStp3PcA+xe0Mo609qkqQ7dptuG8
         0FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104407; x=1795709207;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dd1gd3HFQQdIECo6gd2+bO3Oskz1749IshHJlKLQ034=;
        b=vnMEt+kU1IApi7J6H72c7j+mO/M2TgDLPG7m0IR2pZ5lLjztv+BqqVgW94U+Wf/f6v
         BINuqlsE9iWAdZ28nbw76u15nddZFiy8mNIqU8GXyFOrbzAZo3HdeCJW7oSRkrFdmfpp
         uaO1XhOO/Jd5Z3J31ZV14XlIhNqQGfxLxV+dnPPBvZqMDtGO8Qpr9W99FqlR5v9c2meu
         XP1TsYm5bj4uV6YZsLY3ZeYYFZ1hyvSQxh0fZlIjwuUqqkCfK4+rtcNXlXHgh1cbRLTs
         yvn8NlTKQF13mbbN6VfuI/shUNcZt4/fpULtEU39k5y4C3KNrrCVtukYkKNQpYPIy8VX
         ZeAA==
X-Forwarded-Encrypted: i=1; AL+hErGVUoloBPWoxAxP2G5+pdEsaVn8NQCH8gQsvmyFd98OZNOwH6kMYh5qPuEhKGTmqfT1NOlJehs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ccoqF68aXZe6vEYHN+1QC6+Wx05PMC6LlvXtMso6boQGteGHU
	8MWgHSWy4Z/dL2a3zqpLhFTBgN1EQBluqNq0md122N6+elyxCZ14unqf0R1zJGojeM1aucdrGWY
	fH0CHlR3VRuoY0uVWaofjLPe4aPKOhlYaP6zpK5BlacUvQGQB4kTm7EVa0IntMTWehtBsynRZdl
	jOWIBp0RqXyRfzlhTr8ycvj/jGQ64z0WCs
X-Gm-Gg: AYBFou33ZuWzFiXFQAi0XhDHZ6ZCrcaeVY71u0wwnmihb7ZyhKJaPQzL/11rnCv1cRm
	TCyI1/lr79e8OKUlZwGrNnDO1AhlGd9/rWfWgXyS0nUU+fPN6mzC2iMHiV/ZM+z9aIBh0RwOHMl
	rcxXbUjYr18gjk8qy0a4cHdF/ddqQAuUUBa7mK6g2AubB7e5sgxac7nJA=
X-Received: by 2002:a05:6102:688c:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d6ba3e8aafmr3201241137.9.1795104406571;
        Thu, 19 Nov 2026 08:06:46 -0800 (PST)
X-Received: by 2002:a05:6102:688c:b0:7ce:62a0:6a14 with SMTP id
 ada2fe7eead31-7d6ba3e8aafmr3201158137.9.1795104405991; Thu, 19 Nov 2026
 08:06:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 08:06:44 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <aveMxDqYQobWwXd/@devvm29614.prn0.facebook.com>
References: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com> <aveMxDqYQobWwXd/@devvm29614.prn0.facebook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 08:06:44 -0800
X-Gm-Features: Aa3M54q6YTJdYOifjLiE1IcEMjR2EM19BZZPYXZtaeWVDqOpof5x9jxPqyhxpz4
Message-ID: <CAAiTLFUQMyQXHAw1DbDKfJYus-Se+QA_SSHWQymQ9dK6-UmRTQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/8] vsock: add datagram support to virtio and vhost
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

> On Fri, Nov 13, 2026 at 06:15:40PM +0100, Sergio Lopez wrote:
>> This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
>> the existing AF_VSOCK API. It is intended for guest and host services
>> that exchange independent requests, responses, or events and need message
>> boundaries and sender addresses without a stream connection or application
>> framing.
>>
>> VIRTIO_VSOCK_F_DGRAM gates virtio traffic in both directions. Each virtio
>> send carries zero to 64 KiB of payload in one VIRTIO_VSOCK_TYPE_DGRAM
>> packet. On the RX virtqueue, the device may split a datagram across
>> page-sized guest buffers.
>> START and EOM delimit the message; the guest reassembles at most 64
>> fragments and 64 KiB before delivering it to a socket. Invalid or
>> incomplete messages are discarded. Datagram delivery is best effort:
>> there are no peer credits, acknowledgements, or retransmissions. Send
>> admission uses the socket send-memory limit, and SIOCOUTQ reports charged
>> send memory.
>>
>> Datagram sockets have a separate port space from stream and seqpacket
>> sockets. The latter two continue to share their port space. Datagram
>> routes are chosen per destination among guest-to-host, host-to-guest, and
>> loopback transports, with VMCI as a fallback. VMCI still owns its socket
>> handle when it is present; loopback works without a directional transport.
>> Hyper-V continues to reject datagram sockets.
>>
>> The Sashiko review of v2 also reported that a VMCI datagram bind in a
>> local-mode network namespace creates a receive handle in VMCI's global
>> port space, so a sender outside the namespace can deliver datagrams
>> across the namespace isolation boundary. The issue predates this series
>> and it's getting addressed in a separate patch:
>>
>> https://lore.kernel.org/all/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com
>>
>> Within this series, local-mode namespaces bind datagrams only in the
>> core table and never create a VMCI handle.
>>
>> Bobby Eshleman and Amery Hung explored this feature in their v6 series
>> and v7 work-in-progress branch. This series is a fresh implementation
>> against the current vsock code. It follows the separate datagram port
>> space, per-destination routing, and VMCI fallback requirements discussed
>> there. For guest receive buffers, it uses bounded fragmentation and
>> reassembly rather than full-message buffers or the earlier drop/error
>> queue approach:
>>
>> https://lore.kernel.org/r/20240710212555.1617795-1-amery.hung@bytedance.com
>> https://github.com/ameryhung/linux/tree/vsock-dgram-v7
>>
>> A corresponding virtio specification update has been drafted separately.
>> The wire format and feature negotiation still need specification review
>> before this series can be considered for merging.
>>
>> The first patches expose the core port allocator and add datagram queue
>> reporting, then implement the common data path, guest and host feature
>> negotiation, routing, and RX fragmentation. The last patch extends
>> vsock_test with local and peer tests for message boundaries, routing,
>> connected peers, port sharing, queue accounting, and delayed reads.
>>
>> Testing used QEMU with the F_DGRAM property patch below, an x86-64
>> KASAN/lockdep kernel, paired guest tests, and a nested Linux vhost-vsock
>> backend. The tested paths include 64 KiB messages, delayed-read bursts,
>> feature-disabled ingress, stream and seqpacket controls, and header-only
>> guest RX buffers. A temporary userspace backend still fails stream test
>> 21 on both the series base and tip; that case passes with Linux vhost.
>> VMCI's host personality was exercised in a QEMU guest, including
>> coexistence with virtio and self-send without loopback. A VMware VMCI guest
>> device and Hyper-V hardware were not exercised.
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2026-10/msg08074.html
>>
>> Code was written and reviewed both manually and assisted by Codex
>> (GPT-6.1-Sol) and Claude (Opus 4.6).
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>> Changes in v3:
>> - Preserve Hyper-V stream routing and prefer virtio for guest CID_HOST
>>   datagrams (thanks to Sashiko AI bot).
>> - Bind explicit non-VMCI CIDs and local-mode sockets without a VMCI
>>   handle, resolve wildcard destinations, and retain VMCI self routes
>>   (thanks to Sashiko AI bot).
>> - Recheck bound addresses after receive takes the socket lock and set
>>   TO_HOST only for forwarded guest sources (thanks to Sashiko AI bot).
>> - Probe negotiated virtio datagrams and numeric local CIDs before running
>>   dependent tests; cover wildcard and VMCI coexistence (thanks to Sashiko
>>   AI bot).
>> - Link to v2: https://lore.kernel.org/r/20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com
>>
>> Changes in v2:
>> - Keep guest RX buffers page-sized; add START/EOM framing and bounded
>>   datagram reassembly (thanks to Alexei Starovoitov and Bobby Eshleman).
>> - Preserve stream and seqpacket data when an RX buffer has no payload
>>   room.
>> - Separate datagram and connection-oriented port spaces, and share
>>   receive metadata and queueing (thanks to Alexei Starovoitov).
>> - Check negotiated support and destination CID on ingress, and require
>>   an exact connected peer CID and port (thanks to Sashiko AI bot).
>> - Select a capable route for each destination, retain VMCI as fallback,
>>   and support loopback-only sockets (thanks to Alexei Starovoitov).
>> - Preserve the connected peer address across temporary parent fallback
>>   (thanks to Sashiko AI bot).
>> - Use socket write-memory accounting for datagram SIOCOUTQ instead of
>>   separate transport counters (thanks to Alexei Starovoitov).
>> - Extend selftests for fragmentation, delayed reads, port sharing,
>>   connected peers, and capability-based skips; fix the test build and
>>   README entries (thanks to Alexei Starovoitov, Bobby Eshleman,
>>   and Sashiko AI bot).
>> - Link to v1: https://lore.kernel.org/r/20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org
>>
>> ---
>> Sergio Lopez (8):
>>       vsock: expose the core port allocator to transports
>>       vsock: report datagram receive and send queue state
>>       vsock/virtio: implement the datagram data path
>>       vsock/virtio: negotiate datagram support on the guest
>>       vhost/vsock: negotiate datagram support with guests
>>       vsock: allow datagrams to use directional transports
>>       vsock: fragment datagrams across receive buffers
>>       vsock: add datagram tests to vsock_test
>>
>>  Documentation/admin-guide/sysctl/net.rst |    8 +-
>>  drivers/vhost/vsock.c                    |   51 +-
>>  include/linux/virtio_vsock.h             |    8 +-
>>  include/net/af_vsock.h                   |   31 +-
>>  include/uapi/linux/virtio_vsock.h        |   10 +
>>  net/vmw_vsock/af_vsock.c                 |  526 +++++++++++----
>>  net/vmw_vsock/hyperv_transport.c         |   11 +-
>>  net/vmw_vsock/virtio_transport.c         |  167 ++++-
>>  net/vmw_vsock/virtio_transport_common.c  |  172 ++++-
>>  net/vmw_vsock/vmci_transport.c           |  124 ++--
>>  net/vmw_vsock/vsock_bpf.c                |    3 +-
>>  net/vmw_vsock/vsock_loopback.c           |    2 +-
>>  tools/testing/vsock/Makefile             |    3 +-
>>  tools/testing/vsock/README               |   33 +-
>>  tools/testing/vsock/util.c               |   62 +-
>>  tools/testing/vsock/util.h               |   10 +
>>  tools/testing/vsock/vsock_test.c         |  175 ++++-
>>  tools/testing/vsock/vsock_test_dgram.c   | 1061 ++++++++++++++++++++++++++++++
>>  tools/testing/vsock/vsock_test_dgram.h   |   30 +
>>  19 files changed, 2195 insertions(+), 292 deletions(-)
>> ---
>> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
>> change-id: 20261027-vsock-dgram-support-683a4e0aebe7
>>
>> Best regards,
>> --
>> Sergio Lopez <slp@redhat.com>
>>
>
> Hey Sergio,
>
> Just a gentle heads up that net-next asks for 24hrs before reposting.

Whoops, sorry!

> I'll start working my way through the series, sorry if my reviews come
> back spread out across a few days, not sure I'll have enough time in a
> single sitting.

I was planning on sending a v4 fixing Sashiko's issues. Should I wait
for your review first?

Thanks!
Sergio.

