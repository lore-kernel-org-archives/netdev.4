Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162445;
	b=smjvpiN9F6Rru/Ayw2V0wrvrJqLXCKB7LXx8pZuOyFlZRez3kC5l4Dboku8LSncTMRC+
	 7/OEtyJck3ekAtqTYAHY4INk9TCW4aCfA7AsQIiquV4Ri0NcPYak30YATZOTAoVS/OJCS
	 WQTtfsUMh1drBmPZijOZu6PupI4hVze/mTZhke4eWigdhay6HK8er+2yzW27kIRiRL76s
	 RS+HWhI7lIbcfXgVfEapPWIYXBBd5PjLco1K/O+m1wl8VSEIU8hrPsyBIcQOdfSjLOnjJ
	 YwpTit9IVDwIZPNtHI/3/XHgKHzWlW+rXYWPFy686CmUkQ734r2ZwzE/WBycL+1+sxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
	b=G7/KEWZLZzIS3LjHCSQTAu5Uf2RJibX3nZMzGDtby1Vbml9tnZmwRyfeX18E/dOLv4Yd
	 LrDJFhUB4LWV5JQG/WmBatA242c/NHFN7IZUtT39qQJ5AXSH+LL7CT0JpJcMLKsToHmOC
	 CmNy/JmbCz5hCgkeIE1rvkKZyvWic/HlmL5vTtTXyQf98tqOztuyat9mMVBcmtpjlQau2
	 e3u4gahW04XusbqXaMrDeXLGsAEYp9iXe8Z1hpD2ExuSqdIi5KJPtxgz9L4AEt7C2b+uj
	 lTULxcaCp6Dsv4QA9QF9Th4oEt4AgzF2FKS/Z9B1F2AqPbwF6sAKPIG4c+6xVk5hGhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="02Lc/GYw";
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51380606A33D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51380606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Lc/GYw
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5716f65170dso151446b6e.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162444; x=1795767244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
        b=02Lc/GYw2gxzEmZruC8Z+5VLREVU/C4VyOlAiTMxbtK1EiR9O/InpVdhJt+jsuWdri
         azz8I0igt9BvLiWPwUHwdpK0BHkPn4Lx8FuZqM4E9wyoyqch+PyPwaOBGlWraenWlBmy
         aGiu/xLJvN5Eg8ammghkZk7ivQjJFM/+buBL9D0HCh/0P656asbkAQwatRP93Q0WwNJd
         ShcYWOZPADssfVezfCfKh7pE+WJ21o+uIq6DqzhqRIn8YmMySwhWMlVzeDONdlO6kLLl
         GatYTUYVUi0+ErEee8/+tAxo1dYdLt1DA3iqTS7u5nDLOa36q+Lm2WjY9Ut9DMeun4TU
         Hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162444; x=1795767244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0QMJszuIflUVnI8KlcqSRkClwadTrIU4ZiU7YrghCU=;
        b=VFLJDP61ypJMQat5VJEDY54O3pV4og9qvt86lkd/nPVPAMsYPeez0C57AvqkZFMCf7
         0BUjlsnO2yaNAsozRul0EXgqWRPbs+erJdkosGx+1cux7K6AKqL/cTPPtwDow3z5ZAQs
         CXnbkgU9DayVmzwYmE1LnS3ehE/UiuBaONGP0PFgNTpKoLv1NX9dn2IdtXM8Wba/7CI2
         wSs+M65n9RlSdgngWG8tDV+RbdsoFp4JUghdU8Zuh1aXr8qyeAYvgTu4CIHcyKQY29oC
         hAjpCTuxILgdZl1R1B9eutkxM5Q1APaCQwyt/JHkzanNk5VZvKPeeWuk6CxTb8w+qOgf
         Q3cw==
X-Forwarded-Encrypted: i=1; AL+hErGc2XaF/jlESmZRaxpYILkAVUU7OcMB42hgGmgAUyOxFpRWtl6OIhzz/hIQEVrdpe9wsEHAVgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h+hADPbLieCAtyGN2Hb6XJUzxLy57UmFFZObMpYcqWfLljzH+
	Y6a+qMzRjK9iMcDwWhTg5ddcnAus+1QEnJD8bnr8uC/4xNNrcO9E3uri
X-Gm-Gg: AZFdTZcdWAFU10o/mCtayWLnNCRlawddTMhMbqh0l8jqpbPLgkPj0BNaKA/GChHT5CC
	UkClEIILJsj96BPxuTpJNxhmH2V5QkR0Fnz6t7gfhK/Iew5GzHTPN8j+Sj/trxBjKuOLuQWXpXt
	8fHjZxN2SqK8UZX34FEiWCoz2TCGWiPaKZZNRXLoTKVWeE1oRuub+t9Mnh/V0lfD0G8TTbieXVN
	j8FWUKEAMaiXMU1gbZtXE6ja5ueL/cPaUwmpXQPPjAQnjWX2Ts8EjmivOFNwDrTyMYimeA4aK/s
	eyAHRotoKXqP6sZtISB57jsFVaadTUY1GJPI+SOowqrJ9Z/lT5ICW8/Yyyqrt187UIZ/br4Spxf
	Qb/uqxmM4NhpKODToXpy+untC4aj2yoIGhAuokP8Ew36poMroMXxu7KCKJYXPqyMwAmyHlLkd4O
	OA76tS8I9rdRKek1PGHXwvrtYRfIxI4OT8kmOZPzOCO54XbXjNcu5tpLdxzDB6n3IvqIBimwXlF
	xbZZb5iujg52uw4pKCzN3MFveQRJuceEnwpxPQt8vzppPYYdt/JrCrF/LkVkmoeDmYzoBvEGViA
	vKw4BwKA0mTqEPSWECbdEIDeUZJXhqOjB4OeUrT0FLYJXp2Je0HiOY3ftwbrLjRhL6s=
X-Received: by 2002:a05:6808:1387:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-57a0a937f43mr3229475b6e.33.1795162444278;
        Fri, 20 Nov 2026 00:14:04 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.164])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm1497559b6e.11.2026.11.20.00.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:14:02 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: llcp: fix double put of nfc_dev on interrupted connect
Date: Fri, 20 Nov 2026 16:13:54 +0800
Message-ID: <20261120081354.4098856-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

llcp_sock_connect() takes an nfc_dev reference with nfc_get_device()
and always drops it on the error path when sock_wait_state() is
interrupted.

While the socket waits for the peer, nfc_llcp_recv_cc() can already
have claimed it: the CC handler moves the socket from
connecting_sockets to local->sockets and the reference now belongs to
the socket. It is dropped exactly once, by nfc_llcp_recv_disc() or by
llcp_sock_destruct().

If the interrupted error path still unwinds that reference, the
nfc_dev kref is put a second time. Once the refcount underflows, the
device is released while it is still registered and in use:

e.g. on v7.4-rc3 (KASAN build):

  KASAN: slab-use-after-free in klist_next
  Read of size 8
  CPU: 2 UID: 1000
  Read: klist_next <- class_find_device <- nfc_get_device <-
        llcp_sock_connect <- __sys_connect
  Allocated by nfc_allocate_device <- nfcsim_device_new
  Freed by kfree <- device_release <- kobject_put <-
       llcp_sock_connect <- __sys_connect

The freed device is later used by nfc_llcp_tx_work(), which trips a
KASAN use-after-free write in mutex_lock().

Check whether the CC handler already claimed the socket - it is the
only path that links a connecting socket into local->sockets - and
leave the references with the socket in that case.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: ff353d86a92e ("NFC: LLCP connect must wait for a CC frame")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/nfc/llcp_sock.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..22b2f65e984a 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -683,6 +683,36 @@ static int llcp_sock_release(struct socket *sock)
 	return err;
 }
 
+/**
+ * llcp_sock_on_local_sockets() - check if a socket was claimed by a CC
+ * @local: the LLCP local the socket connected on
+ * @sk: the socket to look up
+ *
+ * nfc_llcp_recv_cc() moves a connecting socket to local->sockets when the
+ * peer answers with a CC frame.  Only that path links a connecting socket
+ * into local->sockets, so membership doubles as "the peer claimed the
+ * socket".  The caller must hold lock_sock().
+ *
+ * Return: true if @sk is linked in local->sockets.
+ */
+static bool llcp_sock_on_local_sockets(struct nfc_llcp_local *local,
+				       struct sock *sk)
+{
+	struct sock *s;
+	bool found = false;
+
+	read_lock(&local->sockets.lock);
+	sk_for_each(s, &local->sockets.head) {
+		if (s == sk) {
+			found = true;
+			break;
+		}
+	}
+	read_unlock(&local->sockets.lock);
+
+	return found;
+}
+
 static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr,
 			     int len, int flags)
 {
@@ -781,9 +811,27 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 
 	ret = sock_wait_state(sk, LLCP_CONNECTED,
 			      sock_sndtimeo(sk, flags & O_NONBLOCK));
-	if (ret && ret != -EINPROGRESS)
+	if (ret) {
+		if (ret == -EINPROGRESS)
+			goto out;
+
+		/* If the CC frame was processed while we slept, recv_cc()
+		 * moved the socket to local->sockets and the dev/local
+		 * references now belong to the socket.  They are dropped by
+		 * nfc_llcp_recv_disc() or llcp_sock_destruct(); unwinding
+		 * them on this error path would put the nfc_dev reference
+		 * obtained above a second time.
+		 */
+		if (llcp_sock_on_local_sockets(local, sk)) {
+			if (sk->sk_state == LLCP_CONNECTED)
+				ret = 0;
+			goto out;
+		}
+
 		goto sock_unlink;
+	}
 
+out:
 	release_sock(sk);
 
 	return ret;
-- 
2.43.7

