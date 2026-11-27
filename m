Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756767;
	b=KwzYv6ePHlgEm0gw2HZ1/B7S6IXXVUCm2aGbZ+/NaU3N8CJ/mzAlLLmfqvKllXAEZ2ne
	 Rs7huuKFYnliaG6PqiDByX/y42GjzNEPUQJyk/0u669zFFwEf/isusRmfIexLm3KhKUYQ
	 7jSVEVSTM87XqF9DOn2lCv1SjKk99KaeLwqhp2tvJrbQW2CMcxun+QOId8MLeJBenkL0t
	 SqKni7AhjG52ITYOcTY5bcloO31Ebh1PUCMXZLZABp01PDDHjxt3Drnf9oHw8J5z+9bZ9
	 aJJrgfIwIX0KbPyB8pwW6P13m6oXx8t1H8aEAWTSvToDnb9ICrc/d32KqhsfroIQwFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xq34tF7uqfa/4VrlGe9UW8XH7BMcoCHDPzLg9RgEtLg=;
	b=YI0KOFA/3O2NnSd8ZyNk83sKeKUz9WmtYMyZgTB+1IM434/6GOzgRP/S+7yYCGVkB7vW
	 vVEcZxJcJ8YLts07AOhSR/zAzD5Xf4nle02hAANNVv8LbKneV27rGHs3Ic9Gxf/heR9cM
	 2d8/avhwr1TyzWIWptWaAyAkgpi5UiV87133MYWPo7EXB/ZgiUW7CSUGwtBfBL7kYE9/K
	 beaanjWIOmYPDcl1s4KMA+waVLWmjJR2teQG5+U88lQ/tHv8LBP06GyLoqP2Z9yk1JPrs
	 GJae7cl5eNAn3IFAy1DPF0aYnAMFSsDdQJiu3s9YJQMj37gQBlE9Wh0ac6NX61gukBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ZhBqqr9B;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A202606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A202606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ZhBqqr9B
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386bd881d39so8331606eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795756766; x=1796361566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xq34tF7uqfa/4VrlGe9UW8XH7BMcoCHDPzLg9RgEtLg=;
        b=ZhBqqr9BT5q7JHP8prmm/+M++HbpT31kUWuZ9x/TfH5rdfkgrqWqB05SYH69t2YJv5
         HmECLbnqYxTsmsf3zOpFdcq9odnih7KrOnYyo6QHEymILDvgrY8F5v4vwQxSuYEgeeXX
         RA62VS/K8SF0bRS//4OkVRN5PK5GKO+b6s0mEUpFB8H+h8IkECh+XqVZ8Hw1U0Y1VtIg
         nJi6oak2z+XC372QgmYQRrKaYT05bb/U8UPM1Rhn0f935QNVIHEFIRmYw7JBqjBSJ5gx
         YUkdafGButXuOSF7EdRqrcUEucPcZt3MP4XrvuMqWpl2UIYV0mCw8GSqS+DVSs5X/wqo
         SGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756766; x=1796361566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xq34tF7uqfa/4VrlGe9UW8XH7BMcoCHDPzLg9RgEtLg=;
        b=gn2at6b5Svx0q5zW0S86+SyjwP5R7FFR8pjyfSly/MGTj/k/ngbcCJNRtBr/ZwbSJz
         L0ptjhICaBosylwkBkqNaOB3R0MJLO7FvDxjz7Re6QFVERfqdqv2SQg5siLhxJ4E5i9O
         LaoAvkW+TBl4+qkd5GDo8CwHMB+9CxIOE5IdC8uZU5aobbeAHj0kHBI2epXC81CMviJn
         7AzveWXXLj3SXhhIkAXb/v5rgXZFOJ9l3iIwRnfB4gWCdeFZ4fa4D1JM6nMovpuFxGyy
         VMytRCVvE7CRonoRMZ4xaYbJCiFcw53dZzOnBnBFYyT6IOGVp6TJ8/1cLrNPlLi8EUM6
         Lgvw==
X-Forwarded-Encrypted: i=1; AL+hErEKZMhhmzu/arFqkVFOSt/TwWZ1xohUdjLhmX3KmA8XGlkgVuCb/IqTC4LJDn6ikj70UXE+YnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o0QtLsz639DipDmNgWgcOomrKElI3tGYlAI799Le78rktvCaL
	1Dp3WPJ3BE4fC9qcudh0pVebVYYTJ2+zACRXtzla5WafHl2ueYMWr94tqJ7eDj3TCQlh
X-Gm-Gg: AZFdTZfxSnKLG7uKhfMtwjBj1wkSHkQBJy9RpQOd34TT1jIP1oUJZfIPwtsXn3en4T8
	rlL/aiUZgaL1G3D0NDVggmO78xvgSM8liLOhWwVKsrXX2Dq9fSqfz/ozQiZVHTkfjGn7D3UUdts
	S6CRYSYnDP6f94G4AFvzZec5jLG0p34zRqZ+GZfhSPkeO7odpKSH6AFto4qMTechecrdit0Yhy1
	vmUsHU4/pWiOXWwYsjbCSTrUl6fboeHd1tSas2kHGCChrl05k4TB88qhZTrcytt2qGZUNkkYJkl
	bbUw59QukbHqXlq4ywAar35OTI26ui0/p5yaBHdi+dGsJDIYbLq/1+N3FRJj7IqUQ6hLB7ezyXX
	uByTsyfGZkFIvLKqTVRB3exr45zwpgI6hPRniw5vaA8EfsMUunzncn1uD8p5ECY9zyXnM14iQxG
	UHEXuIQSUNHLUKrL82EWdWrMIcwzLyOrnby7uOMPmfxDH7FoELjUZgULz62q8au4oNseYItHoco
	EdLRsJY+wpuMGnTcFMsw7ReTzL9uXrvVRk7IHU+/sPI4yTLOZW6Ha4TJQCqnDmP70XGmlLjzvw7
	LvrXdbEtXz2uNJyeYTOn0ouspHoljB2OY/wg49Y=
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id 5a478bee46e88-386da66762cmr4664632eec.28.1795756765613;
        Thu, 26 Nov 2026 21:19:25 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([174.136.206.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm82950093eec.10.2026.11.26.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:19:25 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: virtualization@lists.linux.dev,
	netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@meta.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	arseny.krasnov@kaspersky.com,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net 1/2] vsock: preserve receive timeout across partial reads
Date: Fri, 27 Nov 2026 13:19:13 +0800
Message-ID: <e8c2a7015710acbd5fb1832fd03659414465a399.1795587333.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795587333.git.caoruide123@gmail.com>
References: <cover.1795587333.git.caoruide123@gmail.com>
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

From: Ruide Cao <caoruide123@gmail.com>

__vsock_stream_recvmsg() passes its receive timeout by value to
vsock_connectible_wait_data(). schedule_timeout() therefore updates only
the helper's local copy. After a partial dequeue, the stream receive loop
calls the helper again with the original timeout, allowing a peer to
restart SO_RCVTIMEO with periodic short writes.

This was found with LLM assistance on the Vega platform and reproduced
with the platform PoC in QEMU as an unprivileged user on
VMADDR_CID_LOCAL. recv(MSG_WAITALL, 6) with SO_RCVTIMEO=1s returned 6
bytes after ~4.8s while the peer sent one byte every 0.8s:

    client: recv(MSG_WAITALL, 6) returned 6 after 4.816 s (timeout=1 s)
    RESULT: bug observed. Finite SO_RCVTIMEO did not cap total wait time.

Pass the timeout by reference so the remaining time is retained across
partial reads. This makes the receive wait budget cumulative without
changing the existing blocking behavior. The seqpacket call site is
updated the same way; it only waits once, so the change is mechanical.

Fixes: b3f7fd54881b ("af_vsock: separate wait data loop")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 net/vmw_vsock/af_vsock.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 1d7d53542724..99542ac080b4 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2406,7 +2406,7 @@ static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
 
 static int vsock_connectible_wait_data(struct sock *sk,
 				       struct wait_queue_entry *wait,
-				       long timeout,
+				       long *timeout,
 				       struct vsock_transport_recv_notify_data *recv_data,
 				       size_t target)
 {
@@ -2432,7 +2432,7 @@ static int vsock_connectible_wait_data(struct sock *sk,
 		}
 
 		/* Don't wait for non-blocking sockets. */
-		if (timeout == 0) {
+		if (*timeout == 0) {
 			err = -EAGAIN;
 			break;
 		}
@@ -2444,13 +2444,13 @@ static int vsock_connectible_wait_data(struct sock *sk,
 		}
 
 		release_sock(sk);
-		timeout = schedule_timeout(timeout);
+		*timeout = schedule_timeout(*timeout);
 		lock_sock(sk);
 
 		if (signal_pending(current)) {
-			err = sock_intr_errno(timeout);
+			err = sock_intr_errno(*timeout);
 			break;
-		} else if (timeout == 0) {
+		} else if (*timeout == 0) {
 			err = -EAGAIN;
 			break;
 		}
@@ -2509,7 +2509,7 @@ static int __vsock_stream_recvmsg(struct sock *sk, struct msghdr *msg,
 	while (1) {
 		ssize_t read;
 
-		err = vsock_connectible_wait_data(sk, &wait, timeout,
+		err = vsock_connectible_wait_data(sk, &wait, &timeout,
 						  &recv_data, target);
 		if (err <= 0)
 			break;
@@ -2565,7 +2565,7 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
 
 	timeout = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
 
-	err = vsock_connectible_wait_data(sk, &wait, timeout, NULL, 0);
+	err = vsock_connectible_wait_data(sk, &wait, &timeout, NULL, 0);
 	if (err <= 0)
 		goto out;
 
-- 
2.47.3

