Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522900;
	b=LeYuhFkUclxPizMhi5l5M8Cr22t1SXdC30S4p7IEduAOiXFBVe5Fusqm1feQyngVp00R
	 rK0pRGA2W9l2O6FEibh/T+nbdxB7aAT/9yU/Npgfdkvu9l4ffpPYvfJxWOT68UxpWpBqC
	 KxwcsqCyAb7Wp5Sbodhnf57oP+6MVFLScvkJf0qMNyH43Rcp7qY9mNxSDOn6AgKVdJ794
	 SYuM2NXNuMkgFfkXH4Dh53QAJq6dunuoEyqqDjqWjhOi4FwZ/Jzy3E8RGOj8Ep3UYkDIN
	 6WCz9VI3Qmg3ia3cVByPl5WOggJFoM0DCZKGtlgTCKFfQkn+spL1mtVmG7PQS2DsDbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522900;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9cQHHVr3aOqBbGVAxjQKVEyJOz28adlMyvt5YSYrRP0=;
	b=wpklDKTMKE5Ktf5J7xt1eH3leNrkO4+8JTHbN5+hEjWjhrgy+8yTM2IUrIDpEo5s8lif
	 XPHCKdOC/m5P88A6sH9aFP8tHWYInQCjuI9/EYiEeITaOuDxBzIKwsMgxqrcMkfOM29B2
	 982lKE1Befpt9azlRYpXj15Ntb50RYKM2G+RcczwsHf/poFkMWZKq/5F/jfdD4nRbj6C/
	 6jzCdknWQrI0UIpjYxQnCSurWv5/QoAOAaAX99USoRbZeZMYC7IzgSpCqUYPd5DIlXgGq
	 Q5mM/p0cdbWVoMpoVctjIKN9z3IWkMPjmh10qar2mxorpWYphPDtaOLjEpu+bI+cu3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IaQ5DBHi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eCvfckbn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD392606A6A1
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD392606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IaQ5DBHi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eCvfckbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795522896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cQHHVr3aOqBbGVAxjQKVEyJOz28adlMyvt5YSYrRP0=;
	b=IaQ5DBHiAlmq+OVJTpEtEoQCAWTAm1oR3sN9ywzL0kNHZtGd4BElyYCMaVu882Y27VG1nx
	Bnj97sbUXwJFESu8RinFgNCWkmp17tVmnZvj1q9EgVPF0LSu3GNZVzDuwKAwEsqZLoEFW4
	BweJm0nNiGyMl9qDG+NCqDm+yU54PVA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-B1c5KnuUMLampT13HW3kLQ-1; Tue, 24 Nov 2026 12:21:33 +0000
X-MC-Unique: B1c5KnuUMLampT13HW3kLQ-1
X-Mimecast-MFC-AGG-ID: B1c5KnuUMLampT13HW3kLQ_1795522892
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso2493642f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795522892; x=1796127692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9cQHHVr3aOqBbGVAxjQKVEyJOz28adlMyvt5YSYrRP0=;
        b=eCvfckbn+VsrCCVR39nNo7eCPQ7juYc1+G3g3LzF9n+El5mnFM3J1O1LKUprTG5Igr
         X0+MvdakyjzDs0hUMjSbq69HaTsTigHn6MG+QUqYRlNpNhHlZ2ygSEV0ahvI3x5Nxl2T
         q6ZQgqhoVjZut8s8bXieHOTHJBh5kyhMrjVz6XCtoMP4W7VqqD67ucGpFUBxluHCuPZv
         FoVrqAjhivfxvneZEibJHAdt4d5PQh5LRkHtGx4A4jR0cOz2Hko4tfiDf0pTbCttpasQ
         uM6KHwoSDGwh4EgjOLgm5YzjBv120e2IXK54q0pKtH/VDuemnY/Gx5ItyiK0whOMdkuH
         mV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522892; x=1796127692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9cQHHVr3aOqBbGVAxjQKVEyJOz28adlMyvt5YSYrRP0=;
        b=LzjT5PB/9LugiEDfgF2yLsJPfOPA43M2sTdTMbe8yqIF8UoFVMmxETDGUtIb/pfUm8
         gN8Muv1chC7dZWe3zgs9YgIQPd3FLF8r/0tzki/SrL1wgfAd/LA4MG8+hj7ZTZZibm94
         nVCS9CGFnM/n2L76L088UkRU2vjcvBO2720q+ltIRHr+s2VTjiUX81NTlQV9JZTjnD2O
         7vzxuCC+xbOKrM7dpPpbK3OxlVP2hWo5KmcqkBrtq1kh+02ZRV5Gu/k02Br2bX2W7AWM
         RosWjqmkNQzp41SvnmhjUvCi87h76IBFbQetuRXhq1cyMCh+g4g67TiA/4EpXsOokRmo
         Nezw==
X-Forwarded-Encrypted: i=1; AL+hErEBm+efix5j0YYLlhXitvOBGtdoetWYHk6ZMXMcIyZ02PlWtvEmQni6hG+erQ9wHaFttePk/I4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ycnIsalXtG6hBVe17Fz+3IqtOzxHEGVMEYcfOvKBfr/nP7GPv
	zH1NsuXkd/FZ1UE67oLaDflkPbYoOshq7Sg7ovTPUBuTiDvdWHD4JiRPHxbFBkjSviJZfdIXkJG
	/+rwmJcvakxdYRtBiMhpsqoqvqALdYXeE+SompnSx6BxcDri7uZ3Hb8ryNQ==
X-Gm-Gg: AZFdTZfrhB7Z6tArRxei/S92ecVVJJrdv+AB33lkZKihj8ZzFOYsyFOf4XcP4A1p9hX
	2l8U6kywEEnrXPu5kgBvUZaODAgbxTHLAhSuQqtbJrkMx3ZTLSb6XsNPjPVBikgzT4Hcm2gxJfK
	MzuiFrzgum8qLWniHThpUdDrlCLumXG5N2EM7nmTAJ0kSziXPRJxeEfA6n/GB5MsdXtx7EFSjTv
	220prcn1XKaMB71LSv9pgZ0N+Kxlj2pIusvGxgwdksmsPjlyLTLLd7p805kGHMuekB1RNhMGs7z
	DIpSUylu1f81cp0XFlJtd4TsiGMcFm/N+MLoHbkZHVDEngklt06elfm+/CZNJGpIzms4Nwo8kAI
	HmcnYom/qIrcH/s/SJQdqrO0/0OZQ786bmQhz0r07Kr7E8zLKu7ZnzIukIRiSNWgN+rrlmWiIsF
	qwGikZwJVBHX4=
X-Received: by 2002:a5d:5847:0:b0:49d:1ce3:1849 with SMTP id ffacd0b85a97d-4abb47b2449mr25951026f8f.21.1795522892417;
        Tue, 24 Nov 2026 04:21:32 -0800 (PST)
X-Received: by 2002:a5d:5847:0:b0:49d:1ce3:1849 with SMTP id ffacd0b85a97d-4abb47b2449mr25950966f8f.21.1795522891890;
        Tue, 24 Nov 2026 04:21:31 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm22753198f8f.35.2026.11.24.04.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:21:31 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Subject: [PATCH RFC v4 0/8] vsock: add datagram support to virtio and vhost
Date: Tue, 24 Nov 2026 13:20:18 +0100
Message-Id: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQrCMBAF0KtI1kaapDXRlSB4ALfiIp1O2yBty
 qQGRXp3QxVEcOHyz2fef7CA5DCw7eLBCKMLzvcp5MsFg9b2DXJXpcxkJtcik5rH4OHCq4Zsx8N
 1GDyNfG2UzTGzWKJm6XMgrN1tVk/seNizczq2Loye7vNSFHP1Rs1PNAqeccwLDbUGRG12wfWEj
 V15amYxyo8ihPqtyKSUFmowRakF4I6wau24At+9EPUHohIiCqnA4KaU+huZpukJ5LQAuEcBAAA
 =
X-Change-ID: 20261027-vsock-dgram-support-683a4e0aebe7
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sashiko AI bot <sashiko-bot@kernel.org>, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8791; i=slp@redhat.com;
 h=from:subject:message-id; bh=ZLa/NBdgNmiAXokDGHZH331/KpolNy2jnUwsYb/ELG8=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBrBYFBkV95qLe7+Fpnf9TVnxAud1nCW1nvsex8a
 gfeFZm53wCJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCawWBQQAKCRD0aSeNLwwC
 NZdgEACNgrSI5MoqV6ZIe9yQJuqUi+0cZTvZNiK6Aeyfc8uSq6FOfI58wozqY2mR/iZBJd73sqr
 A+SUm3n5kOEi6jIXnwuLqwqYzBPlyLYaaL5/HP/CH8tojstNrLi6xSjwcjv/yUONzF9LYOVfKi8
 vOqh+DxnDbEnpqWejT1bJR+CZcWuOwUGWtMFL2KD6Duq6AzMKeAxbYLTPI6VZjG+vSElHjjgfYM
 fx1tAzR3N7KiWt5VpyjrH/7lRGifZJcQV9EJn8YnCpN2fVMgHQ6S2wNbLHpspCMOqoD+3waV4W8
 9LFKKaDu6Tr4DDmzCuXK2aCIuhgfeN7fW8BIkG8KvKUROdt4QLj1ykFPEH3IqCufdrlmAXf5os1
 k18nphJ9L+hOu3DnrGH/EngKoMp7ycMUwL1b2yqrA/sfpwpGidUx9G3AqFp7uZW5b5nIUcH+9g/
 5mXt/c7D4nj/hocIXdlOgbwmch2j9vjmR6zWo0+IyF5mhutDc8ayWO3S3HTJuwTAAXKArYPmYSZ
 nJ++dSlAO+nhCVs+z+L3xBa7kkwBWju02zMuUlRDLEGG8uciy87dCDA739t1k5mFOPxu7pkY3JZ
 yWPLnUD+BEZjOVhIwBWjTMlljlKJVuXOPwFoq7HRrUk6itrG1tbMibgaF6pOhe0feFcniD7nCFZ
 kcdNzqR7MVi+Eew==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
the existing AF_VSOCK API. It is intended for guest and host services
that exchange independent requests, responses, or events and need message
boundaries and sender addresses without a stream connection or application
framing.

VIRTIO_VSOCK_F_DGRAM gates virtio traffic in both directions. Each virtio
send carries zero to 64 KiB of payload in one VIRTIO_VSOCK_TYPE_DGRAM
packet. On the RX virtqueue, the device may split a datagram across
page-sized guest buffers.
START and EOM delimit the message; the guest reassembles at most 64
fragments and 64 KiB before delivering it to a socket. Invalid or
incomplete messages are discarded. Datagram delivery is best effort:
there are no peer credits, acknowledgements, or retransmissions. Send
admission uses the socket send-memory limit, and SIOCOUTQ reports charged
send memory.

Datagram sockets have a separate port space from stream and seqpacket
sockets. The latter two continue to share their port space. Datagram
routes are chosen per destination among guest-to-host, host-to-guest, and
loopback transports, with VMCI as a fallback. VMCI still owns its socket
handle when it is present; loopback works without a directional transport.
Hyper-V continues to reject datagram sockets.

The Sashiko review of v2 also reported that a VMCI datagram bind in a
local-mode network namespace creates a receive handle in VMCI's global
port space, so a sender outside the namespace can deliver datagrams
across the namespace isolation boundary. The issue predates this series
and it's getting addressed in a separate patch:

https://lore.kernel.org/all/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com

Within this series, local-mode namespaces bind datagrams only in the
core table and never create a VMCI handle.

Bobby Eshleman and Amery Hung explored this feature in their v6 series
and v7 work-in-progress branch. This series is a fresh implementation
against the current vsock code. It follows the separate datagram port
space, per-destination routing, and VMCI fallback requirements discussed
there. For guest receive buffers, it uses bounded fragmentation and
reassembly rather than full-message buffers or the earlier drop/error
queue approach:

https://lore.kernel.org/r/20240710212555.1617795-1-amery.hung@bytedance.com
https://github.com/ameryhung/linux/tree/vsock-dgram-v7

A corresponding virtio specification update has been drafted separately.
The wire format and feature negotiation still need specification review
before this series can be considered for merging.

The first patches expose the core port allocator and add datagram queue
reporting, then implement the common data path, guest and host feature
negotiation, routing, and RX fragmentation. The last patch extends
vsock_test with local and peer tests for message boundaries, routing,
connected peers, port sharing, queue accounting, and delayed reads.

Testing used QEMU with the F_DGRAM property patch below, an x86-64
KASAN/lockdep kernel, paired guest tests, and a nested Linux vhost-vsock
backend. The tested paths include 64 KiB messages, delayed-read bursts,
feature-disabled ingress, stream and seqpacket controls, and header-only
guest RX buffers. A temporary userspace backend still fails stream test
21 on both the series base and tip; that case passes with Linux vhost.
VMCI's host personality was exercised in QEMU without loopback for
self-send and with loopback for CID_HOST/CID_ANY routes. Active virtio
and VMCI coexistence used a synthetic VMCI-like fallback. A VMware
VMCI guest device and Hyper-V hardware were not exercised.

Targeted QEMU reproducers for v4 cover a filtered nonlinear skb,
repeated peeks of an empty datagram, guest own-CID routing without
loopback, and local/global namespace test behavior. The numeric
own-CID routing reproducer used a synthetic guest-to-host transport
matching virtio; the corresponding selftest has not run with a
negotiated virtio guest device.

https://lists.gnu.org/archive/html/qemu-devel/2026-10/msg08074.html

Code was written and reviewed both manually and assisted by Codex
(GPT-6.1-Sol) and Claude (Opus 4.6).

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changes in v4:
- Size vhost receive skbs from the declared payload before socket
  filters run (thanks to Sashiko AI bot).
- Keep empty datagrams visible across repeated MSG_PEEK calls
  (thanks to Sashiko AI bot).
- Reject CID_LOCAL and directional wildcard/self-CID datagrams when
  loopback is absent, even with g2h_fallback=1 (thanks to Sashiko AI
  bot).
- Preserve VMCI datagram routes to CID_HOST and CID_ANY, including
  connected wildcard sends (thanks to Sashiko AI bot).
- Skip unsupported SOCK_SEQPACKET iterations in local-mode vsock
  namespaces (thanks to Sashiko AI bot).
- Probe VMCI self-send before running its SIOCINQ test (thanks to
  Sashiko AI bot).
- Link to v3: https://lore.kernel.org/r/20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com

Changes in v3:
- Preserve Hyper-V stream routing and prefer virtio for guest CID_HOST
  datagrams (thanks to Sashiko AI bot).
- Bind explicit non-VMCI CIDs and local-mode sockets without a VMCI
  handle, resolve wildcard destinations, and retain VMCI self routes
  (thanks to Sashiko AI bot).
- Recheck bound addresses after receive takes the socket lock and set
  TO_HOST only for forwarded guest sources (thanks to Sashiko AI bot).
- Probe negotiated virtio datagrams and numeric local CIDs before running
  dependent tests; cover wildcard and VMCI coexistence (thanks to Sashiko
  AI bot).
- Link to v2: https://lore.kernel.org/r/20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com

Changes in v2:
- Keep guest RX buffers page-sized; add START/EOM framing and bounded
  datagram reassembly (thanks to Alexei Starovoitov and Bobby Eshleman).
- Preserve stream and seqpacket data when an RX buffer has no payload
  room.
- Separate datagram and connection-oriented port spaces, and share
  receive metadata and queueing (thanks to Alexei Starovoitov).
- Check negotiated support and destination CID on ingress, and require
  an exact connected peer CID and port (thanks to Sashiko AI bot).
- Select a capable route for each destination, retain VMCI as fallback,
  and support loopback-only sockets (thanks to Alexei Starovoitov).
- Preserve the connected peer address across temporary parent fallback
  (thanks to Sashiko AI bot).
- Use socket write-memory accounting for datagram SIOCOUTQ instead of
  separate transport counters (thanks to Alexei Starovoitov).
- Extend selftests for fragmentation, delayed reads, port sharing,
  connected peers, and capability-based skips; fix the test build and
  README entries (thanks to Alexei Starovoitov, Bobby Eshleman,
  and Sashiko AI bot).
- Link to v1: https://lore.kernel.org/r/20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org

---
Sergio Lopez (8):
      vsock: expose the core port allocator to transports
      vsock: report datagram receive and send queue state
      vsock/virtio: implement the datagram data path
      vsock/virtio: negotiate datagram support on the guest
      vhost/vsock: negotiate datagram support with guests
      vsock: allow datagrams to use directional transports
      vsock: fragment datagrams across receive buffers
      vsock: add datagram tests to vsock_test

 Documentation/admin-guide/sysctl/net.rst |    8 +-
 drivers/vhost/vsock.c                    |   83 +-
 include/linux/virtio_vsock.h             |    8 +-
 include/net/af_vsock.h                   |   31 +-
 include/uapi/linux/virtio_vsock.h        |   10 +
 net/vmw_vsock/af_vsock.c                 |  550 ++++++++++---
 net/vmw_vsock/hyperv_transport.c         |   11 +-
 net/vmw_vsock/virtio_transport.c         |  167 +++-
 net/vmw_vsock/virtio_transport_common.c  |  172 ++++-
 net/vmw_vsock/vmci_transport.c           |  124 ++-
 net/vmw_vsock/vsock_bpf.c                |    3 +-
 net/vmw_vsock/vsock_loopback.c           |    2 +-
 tools/testing/vsock/Makefile             |    3 +-
 tools/testing/vsock/README               |   42 +-
 tools/testing/vsock/util.c               |   62 +-
 tools/testing/vsock/util.h               |   10 +
 tools/testing/vsock/vsock_test.c         |  189 ++++-
 tools/testing/vsock/vsock_test_dgram.c   | 1230 ++++++++++++++++++++++++++++++
 tools/testing/vsock/vsock_test_dgram.h   |   34 +
 19 files changed, 2428 insertions(+), 311 deletions(-)
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261027-vsock-dgram-support-683a4e0aebe7

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

