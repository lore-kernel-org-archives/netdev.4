Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965915;
	b=ByBdqd0yShTa/xVrcW0cCZa1B1vGsLGmgNZeFwLGmo4U7krecXISvST10fBHVef9kqUV
	 Cr9qqeRIuzRZVorroQExkd6+gXF1nTQGIl7qSuMxDnZ3FGeLsefqNXYAM6Ip3nWbv8QsV
	 KhdB4bhcTNtv7Y/Wb0GH71ByKNL2+vpOKQcBVbkcquF3OVqmlACoN9vpbMeM8z4Y3oPiU
	 sk3v/2C7o+JyvyJKeOleemH+4dh7kEcwuM3EE+UpV7bAtTqN2AYrHfPkwsI3MltdP2POq
	 NtmF80OTu826xjxaRz4F347mJah4ZvWspzsTQRGIHK3GE7kFFVlorkJFgAbC42aiVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X4FNYHTT1LKVhYoSP9CXX5H2kEYFt4XaTxI0OzwyTm8=;
	b=37AEBat0iFptl9oZSW5J9ko+DHNFqyQFLxNp5Dkyyf5wt/EfcsUX+mrYlLb7c1IHkRxU
	 8Q6eE3GIpstCedwdlyn6rUMgGXxwicguFcTqrGpBQWbCVUnavyrbx8RQB/T2qlyD0/3Go
	 346XBFarFd94I83yZ2E2YSunGFBb/ur2K7diQBHuMsUpTE2dhEEX9D7qc1H7Eqd5R9H73
	 xmU7sQDB91wcJAAWIdzVfN5rEXVJSVrvIgTZkQz0Hz04KNlPQhJonZxeRV996YX5EPGAB
	 bPEYRE+wOtI+yktxqdbMabtcfDqXOov+BZPZ8t57iV95NY1XqQarQNhfjY6OVku9v8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDjRkcYt;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2671606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2671606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDjRkcYt
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4944a0eso408830c88.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965914; x=1795570714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4FNYHTT1LKVhYoSP9CXX5H2kEYFt4XaTxI0OzwyTm8=;
        b=CDjRkcYtnqM/n2li4FgiBYKjz6es1d5tWqHyQ28xR58K9oi3aeS0XCGDqydk+h2ZJl
         IQb1uBeu24QApSjibR9lY0a8mW7UxMJsW/TXO0p3teEtfhA1zaDRF68xSPRmtrj+wTpH
         CVLnXd4eOidWoektD9wy/NbExdwUonqzj/GQ7MqxsS26Y6JJQKmCIP05askktb0gJEka
         0QLamCOoQgCJc3SxskW+Qodx98yEZBJ/bxnRhaoF1pOc2o9Uiv9Ik6dFPYzfrDJNI0XK
         fhDH0XxXc9MjqALTP1QZefQld/RQ5+xI+aXnaNVNUU1SkUOVO6CzhUtnBMmepSI4IEtK
         8TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965914; x=1795570714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4FNYHTT1LKVhYoSP9CXX5H2kEYFt4XaTxI0OzwyTm8=;
        b=K4k7tbSLvmTp7HtnsYJTM4GQg+oj2OIcbkHPuAQHhN7OwZ35JHeknrWT5tV0gQh1mX
         vUaVY6aRFRwGM3C8ns8dhceLyJSVYkkqL6HjgJFXfEPsH1eNNwLqDjuKvnZaLWKdekAQ
         vnW/4135Ok8eGRGEBirGVy+k3Gb9DPPAh8YSs1VuMrD22Sa6BVaphkwQmh76gQsQqmAq
         Pivyz8H8JF/XywMgcxWuGLKB2DsBeXkM3pR/QmhJhm2adWKPxuL3v4BlSc0Cp93Ohkrs
         SKtNGN5lsHwKdKa+tkA9/Ve4KasVqnHuJp06vfAKkB8c1q0Fkp+dvhlxgEg4PjJwwNn3
         N1BQ==
X-Forwarded-Encrypted: i=1; AL+hErF6n5j+lqo+NqzUHFfizp8NwfDchjAuFoLron1cNMRU94MLKCSJmC2GKjVfrVKVam0PPwwX9Cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+e0uYG0x45qYMkBNGcZUv5t0+fMB3mSCmb+ZXxTKL8rMvooGP
	h3eW+chlVjNGYsgirAwOtx0ngXQqFBd5Eh7rwRMlXBnrgTQv+glpObRb
X-Gm-Gg: AYBFou3Qfo+Evbt294n0vnzs8+ulnCpPhIm+4OgeiC7t3Wc/3sJC52Z3MTZMku/l39z
	73BAYzqOybkCy6J7wlVTx++mEZ/8MZnidm+pK3NiyxRSwEuFBsl+lBjGU//Qqx9UAZ/pNSfRGMu
	9Y8TxRzwR3BjFRrFOsLDs3TE6UFUM6gtEKwVrB/n3/C285C1QQi9qK880v6r2VLZqPUEZ6NKrcE
	tjPlsaaGfX2WKRdtfCxpZCknGKIFzDrcvHqqqcwanzcnaVni5UxW/irPjtQPRP4df3vDv2HqRRD
	QAK9x4h5P6BkS9nFsLQxvGGHQHX5nwDEDQsNWmi9LRA99mxqW6iZTguB+KPrxa+psy1h6oV7D9J
	JRLCo19hytDTohrf0KjMcSFpMa26CzaQ6E0Nn6UclLMd8BjuKNR/W4CgMB0RE+hg48EFmJVefel
	gLn4E//otIRlxi4V1ezqllmG+Ju8ASneDMUV3UK0IafZ7BCTFdebW/A3iJwaHNYUdZhbTWpDawe
	QlND//Qpd+aFa3a1GKTPF3Ksg1zk7F4mH2iLvZZxcd3/3U/U1CLwnfwko8VMAZ3hY2lM4NE6Fca
	XJFO1uZGcT8qpHt736FqLC9jd9ghMw==
X-Received: by 2002:a05:7022:170c:b0:1b5:3819:f8a with SMTP id a92af1059eb24-1b543bff8bdmr1034444c88.38.1794965913693;
        Tue, 17 Nov 2026 17:38:33 -0800 (PST)
Received: from phi.nguyendp ([116.86.30.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm1909602c88.6.2026.11.17.17.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:38:33 -0800 (PST)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Asias He <asias@redhat.com>
Cc: Nguyen Dinh Phi <phind.uet@gmail.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] vhost/vsock: annotate lockless accesses to guest_cid
Date: Wed, 18 Nov 2026 00:48:43 +0800
Message-ID: <20261117164916.2332953-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vhost_vsock.guest_cid is written by vhost_vsock_set_cid() under
vhost_vsock_mutex, but It is also read without that mutex in
vhost_vsock_handle_tx_kick(), and vhost_vsock_get().

KCSAN will report data-race if we issue VHOST_VSOCK_SET_GUEST_CID
ioctl while the device has TX traffic. For example:

 write to 0xffff88810f1596ac of 4 bytes by task 7914 on cpu 1:
   vhost_vsock_dev_ioctl+0x25f/0x720
   __x64_sys_ioctl+0xc2/0x110
   x64_sys_call+0x299/0x20a0
   do_syscall_64+0xc9/0x510
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

  read to 0xffff88810f1596ac of 4 bytes by task 7910 on cpu 3:
   vhost_vsock_handle_tx_kick+0x41b/0x740
   vhost_run_work_list+0x97/0xc0
   vhost_task_fn+0x98/0x1f0
   ret_from_fork+0x2e2/0x3c0
   ret_from_fork_asm+0x1a/0x30

  value changed: 0x0000004d -> 0x00000032

Both readers load the CID once and works correctly with either the
old or the new value.

Mark the store with WRITE_ONCE() and the two lockless loads with
READ_ONCE(), so KCSAN knows the race is intentional.

Fixes: 433fc58e6bf2 ("VSOCK: Introduce vhost_vsock.ko")
Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 drivers/vhost/vsock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 88a310390eb0..f26c59013075 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -78,7 +78,7 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_cid, struct net *net)
 
 	hash_for_each_possible_rcu(vhost_vsock_hash, vsock, hash, guest_cid,
 				   lockdep_is_held(&vhost_vsock_mutex)) {
-		u32 other_cid = vsock->guest_cid;
+		u32 other_cid = READ_ONCE(vsock->guest_cid);
 
 		/* Skip instances that have no CID yet */
 		if (other_cid == 0)
@@ -572,7 +572,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 		hdr = virtio_vsock_hdr(skb);
 
 		/* Only accept correctly addressed packets */
-		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
+		if (le64_to_cpu(hdr->src_cid) == READ_ONCE(vsock->guest_cid) &&
 		    le64_to_cpu(hdr->dst_cid) ==
 		    vhost_transport_get_local_cid())
 			virtio_transport_recv_pkt(&vhost_transport, skb,
@@ -859,7 +859,7 @@ static int vhost_vsock_set_cid(struct vhost_vsock *vsock, u64 guest_cid)
 	if (vsock->guest_cid)
 		hash_del_rcu(&vsock->hash);
 
-	vsock->guest_cid = guest_cid;
+	WRITE_ONCE(vsock->guest_cid, guest_cid);
 	hash_add_rcu(vhost_vsock_hash, &vsock->hash, vsock->guest_cid);
 	mutex_unlock(&vhost_vsock_mutex);
 
-- 
2.53.0

