Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851717;
	b=LLH7MwXadPCW326jWUXKA1N+OXT5NXPOiCFdPMDn2z6dp2C2R1SCk+gQV+eveW59QLgL
	 4qQ9FqULxsf5s2u09mgs7yvmR83SM4R7vzQnIsSr/Ks6FW5uP5OzOrKNGlAyTZokC5qUW
	 6/ED83zVnWi4YJegBpyvlKKxcmjU5BUyIoftygzyC5djIgJgarf9I//Gkn6jZhtc+O6Ax
	 dk1UtxL9z0EJ/2wqFWgc9rbWqc0Cg3/krzGC8oN8/Ohk6iR1OLGkNTi36gCVMK3Rt6s+5
	 zk14Qy0VLzcFgKVlLnRb4yTCd4+wUvnRo1M1tSRnUT3NNGSyli01mItxgda9pp6jS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
	b=Q2rvf3BeZmI1qpz1o80Ws3l+N25OU0TFc1LEjonySdx/akg2wTW+AAdjCaplsNnHFiz9
	 QI10YtiMVWysr0b4k2lV2gBbBliukh+UNF08S3YUbpjZoExPcO1DJ8K/nA2vdK2E9Tts1
	 AD5E7k4y1INnn/e7K0B5KO10xz2cV/tZhRU8CgqKcw5KqLU96WQTOtipkk0Q7SbGGm1vM
	 vgpXKbG4WQR8vP9D/ZzcijATuzvSCFFJSOvntm0HzM1lBfAHK4c/LdC6BRVa+Ix8Z2HFe
	 WIvMVtavAe4RhntNwkUVOp9w9BWY8w2gyZKMURG+14342tXTx5E70tdtfMuYMqTIuvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgcE75qo;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A9606A88E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1A9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgcE75qo
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94961bfe1a0so168387485a.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851716; x=1795456516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
        b=GgcE75qoZKVQJQFnhQGIRH2hvnsY333YcZp05pyOL54t4PvAmRebNm7M7D4DwU/qur
         90weKQMC8AHcQVhxD9s04wQgawJSO6ZlAomSfCvq2Sm1glmq4RZCmR2xLZTCBmnhIHKT
         uASoYXHBmzDwESsK8rdHERLyk6iPOqBCeA8y64vQm+JW4gwsWMBfUThXLTwd2NwYZhy5
         X0hiq3GOl+3VKnYw/6TsQdGIJckdq29pDTWFJuH0LgBlgDKr+ya/2+8wvucPPUdv/ZHa
         hN6RoNqBUZTSsFL+APeE3ojHZ5wawx9FnXpUX5QCh9oUsW6dmsyKPa2Dzt0xZ/jZaSKO
         qeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851716; x=1795456516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
        b=WU9fI1VN6GTEnvZaDoJkU8MtO/wvyRm+ge+xbIJL2qGeW3R0qsfDpoKRthW3gmkTiZ
         1RxQRUGpmGeiQuM2ZqNnYdrpKUWWmMwSylTnNXx12uRdevjPR97BqM9xbe6RL+LB3vYR
         OJIZlNL8eMnO/hoCXrzQhASuBThEFSPUXfBrwChQtHaqNFa4Fd/avlDvTuJy/sS9c6um
         yPvyCisZAZZspCGVREwGN/WqZWpt0HcGHN0KyHL46/RLLxmoHuTRsAiy0XTYRLNO7Qzf
         PRxMPrescRDDteBbIuk0i6tFrQ34NyJFEQ2X1FjAZ9QDBPD6k2RiRiLtlEcOZN/oN/bM
         I2XQ==
X-Forwarded-Encrypted: i=1; AL+hErGUQHJj1s7MHSqHnPgPLLfku9n5AqC6oygRrLv6+uP4CkyUHr2ajICiZrYnBUlDGn/ZtYpLixo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/I+7+Uu216BUF7Yf2/Mjh8CqK2Hwgah0Ggn1ZgyxeRwDub7Vi
	8r+MXsBMWd8j8Neme5+6uG/6Y5xB2TQpSwtcF7Kwz5EurNqdnRAZXoFz
X-Gm-Gg: AYBFou0Jt7xP/UUCb4Ni9MTyeEMyuwru3Mv/+m/3McBKDGh2PeWoEUnonlMrv8N4Fml
	g50IlxwgqmMfe+xo2UzeyJUaduMlAMO+BqJRmepT5/z4J6hrC102bCmR5NlIkcuTcmbXZjf4tmo
	lbtUoJBonRZKVCTBZ3Ch7ntv5+OuF+dqLxS2AZBAGt9uDz2+ZX4+XBij8KELxBysEcVNMnwDi2f
	qCg+r9nSZcAART/Pq5bK6jiHreVrI4EYmhf40BwtD77EDiibGIZCYy4U6ZbeLX/N0pfxgwtFELf
	S+wrLFwty5XWN1sMd5ITYdajE9h1jpEQGQL/48SRNJtFWl4ivGTyAQhm0efaArsfn1mM5Syisyy
	mZMhHjDUF50AZQNBM4bHXcnt/66dWtuk4KJR1s2L7PlwDS/79LXVOQknW3p3fVl5yx1yZYml8iX
	MLF1Vwphm7X9BsV1mMUyTRRRv4e8KUWk9H8KYLg26ZpkNP8xmIeq+6/rVq363pA9r+iItuXCijS
	iFdH4MjZ1T2I+D4ZfoownGJPYl9nCEuet79895ZBoHUQHRUMi4n3dAjKz/we3KpFnYx8bpl3Aue
	VKvYFioiKEOhUU+cdfMT6efiNZrx0ptGWyg6vtmwB1cVNeFNQrZhMba/s97ujV+Zgh4jIOalE/h
	wwq+BBTxeNB535rh1P84NepJKV4sja6I6MGWgKGiP1iUblkLj+akcQGgq
X-Received: by 2002:a05:620a:710c:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-9494b9e114fmr1735275085a.12.1794851716146;
        Mon, 16 Nov 2026 09:55:16 -0800 (PST)
Received: from str-mac-5701 ([2600:383:10c5:608f:b04c:c18a:ec2:dbf9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497dc91f48sm283670985a.42.2026.11.16.09.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 09:55:15 -0800 (PST)
From: Ethan Ferguson <ethanf108@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethanf108@gmail.com>
Subject: [PATCH net-next v2] net: remove CONFIG_NETDEVICES requirement for SO_BINDTODEVICE and SO_BINDTOIFINDEX
Date: Mon, 16 Nov 2026 12:55:04 -0500
Message-ID: <20261116175504.15295-1-ethanf108@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The SO_BINDTODEVICE and SO_BINDTOIFINDEX sockopts return -ENOPROTOOPT
if CONFIG_NETDEVICES is disabled, but the lo interface still exists.
I believe that these sockopts should not fail on the lo device just
because there are no other net devices.

Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>

---
v2:
- Reverse xmas tree
- Use net-next tree
v1: https://lore.kernel.org/netdev/20261110204524.82341-1-ethanf108@gmail.com/

 net/core/sock.c | 61 ++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index e529ffeaedb9..4225e0569125 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -635,18 +635,14 @@ EXPORT_SYMBOL(sk_dst_check);
 
 static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
 	struct net *net = sock_net(sk);
 
 	/* Sorry... */
-	ret = -EPERM;
 	if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
-		goto out;
+		return -EPERM;
 
-	ret = -EINVAL;
 	if (ifindex < 0)
-		goto out;
+		return -EINVAL;
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
@@ -655,12 +651,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 		sk->sk_prot->rehash(sk);
 	sk_dst_reset(sk);
 
-	ret = 0;
-
-out:
-#endif
-
-	return ret;
+	return 0;
 }
 
 int sock_bindtoindex(struct sock *sk, int ifindex, bool lock_sk)
@@ -679,48 +670,40 @@ EXPORT_SYMBOL(sock_bindtoindex);
 
 static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
 	struct net *net = sock_net(sk);
+	struct net_device *dev;
 	char devname[IFNAMSIZ];
-	int index;
+	int ret, index;
 
-	ret = -EINVAL;
 	if (optlen < 0)
-		goto out;
+		return -EINVAL;
 
 	/* Bind this socket to a particular device like "eth0",
 	 * as specified in the passed interface name. If the
 	 * name is "" or the option length is zero the socket
-	 * is not bound.
+	 * is unbound.
 	 */
 	if (optlen > IFNAMSIZ - 1)
 		optlen = IFNAMSIZ - 1;
 	memset(devname, 0, sizeof(devname));
 
-	ret = -EFAULT;
 	if (copy_from_sockptr(devname, optval, optlen))
-		goto out;
+		return -EFAULT;
 
 	index = 0;
 	if (devname[0] != '\0') {
-		struct net_device *dev;
-
 		rcu_read_lock();
 		dev = dev_get_by_name_rcu(net, devname);
 		if (dev)
 			index = dev->ifindex;
 		rcu_read_unlock();
-		ret = -ENODEV;
 		if (!dev)
-			goto out;
+			return -ENODEV;
 	}
 
 	sockopt_lock_sock(sk);
 	ret = sock_bindtoindex_locked(sk, index);
 	sockopt_release_sock(sk);
-out:
-#endif
 
 	return ret;
 }
@@ -728,42 +711,32 @@ static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 static int sock_getbindtodevice(struct sock *sk, sockptr_t optval,
 				sockptr_t optlen, int len)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
-	int bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
+	int ret, bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
 	struct net *net = sock_net(sk);
 	char devname[IFNAMSIZ];
 
 	if (bound_dev_if == 0) {
 		len = 0;
-		goto zero;
+		goto copy_len;
 	}
 
-	ret = -EINVAL;
 	if (len < IFNAMSIZ)
-		goto out;
+		return -EINVAL;
 
 	ret = netdev_get_name(net, devname, bound_dev_if);
 	if (ret)
-		goto out;
+		return ret;
 
 	len = strlen(devname) + 1;
 
-	ret = -EFAULT;
 	if (copy_to_sockptr(optval, devname, len))
-		goto out;
+		return -EFAULT;
 
-zero:
-	ret = -EFAULT;
+copy_len:
 	if (copy_to_sockptr(optlen, &len, sizeof(int)))
-		goto out;
-
-	ret = 0;
-
-out:
-#endif
+		return -EFAULT;
 
-	return ret;
+	return 0;
 }
 
 bool sk_mc_loop(const struct sock *sk)

base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.56.1

