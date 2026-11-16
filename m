Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830699;
	b=Vf02u42PFyJw8Xo/53NCxb1wcx0axtDqushiFWQBVa1n/E0KXbND0XZHU0ea+DmW0tYn
	 +/XelSeh+CFUkEz4V9f/qjKJ8V2DOrLOI0xfcW0F7adXkv7nT6ZRDcf5/L28hvDH42C9/
	 4n1gNpLBjFByZGHXujzNyrpRwBGSA458dBbr2a1wQWazQqY2cjohFp8m7bdEkN26RTW7s
	 koJcLYL/hWcfqnAJkJDIStEizUgpOIPeiWJp9FHFaoEoWPnB0EnDNiJyTvYIIMAYBcwIE
	 IJdJ3xkOGSO7g+k+y4nG132DxYSm6xjYayknL77+Uq1giR093U72WSd860sTLweNEiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
	b=etNXB5D2XPj0vMwFwSZHFXQz70gBVYH+w8V0qZY+fbIEq7NGoikgIvua74Atzdxdy87I
	 exskgUxV1fcHKkvsp+gll6OAHPkpK+s0SnEr4EotQE+tt3gV/eohnj9Sg3YFDdohSkUle
	 850g+44vmf/c0AhSKHFXftbE7Xzxb3DvDveCV/IKdt2B+20uiI11zSNFq24jOViWCxp7s
	 H9JkhzFAlW5UuKIbFwdWEnbMe+xYEZqHsoyOneVhKVQdkyfWZuy8ebg8CchtyeLgYmB7O
	 yTk3/fRrmLXBv47o5R0XDPdTEq6jiFpNU6YB61Dx/VKBEAc4UsnpUVccrTDrTLfuIUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCE606A33B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BCE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be1e468a8so2420157d50.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830698; x=1795435498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=0I5X9Fro5lTpqrbTIJJvYIobMHUh80nHVy51NkUgs0cZyJk7aueiHYWXPwaLeIOvZN
         qwJGzc6RrLUvj9I5DLGaQTXn1ewCUUSnKPbTTE7o5Ysx12G9MF3+NIe7DPP1Wtsr6BQa
         CoqU9SBM+he7p8Sxw0U51krnBadTzBWn+2yiALp24XnEhLwbfT/U3YB6/UFSmsxTSE7D
         ZSgoMOTZywFZ3HogO+Od+P3dPDl8TBVWHtCJmlWqMbhYbRvw8ansbw2YJ38ttYsXTWpB
         z0PtVq//0Ehsdgww5oEwRifxndf9H6qlH7wm4/akCrejK2nU/TgL+s4a8vZQFHwHPigH
         nwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830698; x=1795435498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=fHS4fFToekaKc0xkDCX7rFl0kSnu74KJ2cggBosiIw2Ki77o0UVZWkDQdGe0tSCUWF
         JMUfWn9iJ5T7QSkZj5ZgFkoA6UdyfAFzDIlTUKusx75vGIC4kRNSfQd1Xu8PLYBO+Mr6
         ehSpm2QD6MzZSs1XK8F3Y5BKoy8gBgkuVWr0RxUac7lTn6iEaR0N6lp1YK8drAv1shh0
         FKTVImK58OaWKjnoIgqjKaZmQNwHzjE+Kqvwb4Nc8PRqYbitEk6ETYC7b10FbcNvrIAB
         7czYjUg01WxyTOQEOA6H12Fd4VOjA9QctHl7n4L7faawjluHJjfKTCi+JYfXql6M2hbL
         S+dA==
X-Gm-Message-State: APuU4Z9vS9c1jecyzsFdZRrVegpK+IWqRrGVm9Ik/m7YtpoNyiAqYi8X
	I4UTxOXlNvPuGJ1TtxDOIPxgY7qznQy6ykUQLqFlEzqHtFIv4nLW5AzA
X-Gm-Gg: AZFdTZdBy4G2hGfQPFGWDiy/EAxAYb3OAO1S8GMwnvXhH5yVNAC68HXJmPKsXL8MBzL
	7jtkUTq1TBtCqm8w5P6ZH2Z3h2AalXzBR7ZhQmVKftfiPCK3UYGrOyAtEbiZ4yp55mP0ZBS3L8p
	O4wmq+D2Tio/HymtbOraUKURN7hwS0mOtOvsDBpY0oijz5GQ44UgeC4X5O8xqjUI1z+yAGy7pjp
	CHeRbqvkmVJigzA7EaP+fm13qKfBJ5DVnCUxNer/7l2qOmhxGVha863RrStTGA9a/rMX590YeL0
	Gb+e3Ehdk4LLSEpsUaT731499dajna9VmFuQRWtrSTyY4QHFoD4KX5h8ecD5co1Wdayc8Plim9Q
	Wx6/vlDCrYG8fxie8PWUyh9ajkdAESrUK8qaLve1ej8DdQnxjIHnyoErEFI6g9m3r4yXo/UFbIS
	SxlIpypuAOxJnrBEo4vjX5BX8gHtybhaPbaviuC9qkT6n30vwD8q1nxX8bBY37bcVgo69lPhHNT
	5Oqhar9F0G5Ow07NY/EYWI724zlolDHsbWQVxLlL5um3OYtAaaZ/aIaypncPAzlCFeJHBd+ijqC
	zS82g9VnpLkTvi9lRbBKTV2Q76/XCjnt6GB1gWM4edg5JTpy
X-Received: by 2002:a05:690e:1c1b:b0:67c:b95:6757 with SMTP id 956f58d0204a3-67d897366a7mr6743663d50.80.1794830697852;
        Mon, 16 Nov 2026 04:04:57 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:75::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm9706309d50.10.2026.11.16.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:37 -0800
Subject: [PATCH net-next v4 2/5] psp: support tx rekey operation
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
Message-Id: <20261116-psp-v4-2-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new association is spliced into the socket
with RCU to be used immediately in the tx path.

Drivers that use on-device tx key storage need additional logic to delay
key deletion until after any in-flight users of the key have been
drained, so return -EOPNOTSUPP for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count the socket twice in stale-events
- document that the previous rx SPI also stops being accepted once
  its device key is rotated out
- drop the claim that the peer accepts both the old and new SPI
  after a tx rekey
- document tx rekey in the tx-assoc op doc in psp.yaml

v2:
- place new assoc on pas->assocs list instead of psd->active assocs
  list
- reject tx rekey on SADB devices until deferred tx key deletion
  lands
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     |  5 +++-
 net/psp/psp_sock.c                   | 57 ++++++++++++++++++++++++++++++++----
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index d5713f5d1af7..f6af1a510d17 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -283,7 +283,9 @@ operations:
         post: psp-device-unlock
     -
       name: tx-assoc
-      doc: Add a PSP Tx association.
+      doc: |
+        Add a PSP Tx association.
+        If the socket already has a Tx association, rekey its Tx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index fab797506b0a..43f222b38d3d 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -145,7 +145,8 @@ Rekeying
 
 A connection which has completed the exchange described above and is
 in the "PSP Full" state can be rekeyed in place without being torn
-down, using the same netlink calls as in connection setup.
+down. The Tx and Rx directions are rekeyed separately using the same
+netlink calls as in connection setup.
 
 ``rx-assoc`` allocates a new Rx key and SPI, which should be passed
 to the peer exactly as during the initial exchange. The SPI which was
@@ -154,6 +155,8 @@ next Rx rekey, or until the device key it was derived from has been
 rotated out, so packets the peer sent before it learned the new SPI
 are still received.
 
+``tx-assoc`` installs a new Tx key, which takes effect immediately.
+
 A rekey is rejected with ``-EINVAL`` if it would change the PSP device
 or the PSP version of the association. It is rejected with ``-EBUSY``
 if the socket has not completed its initial exchange in both
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index c1e38845f08c..d497f41c483e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	return err;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	int err;
+
+	if (psp_dev_has_sadb(psd)) {
+		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
+		return -EOPNOTSUPP;
+	}
+	if (!pas->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	new = kzalloc_flex(*new, drv_data, psd->caps->assoc_drv_spc,
+			   GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	new->psd             = pas->psd;
+	new->dev_id          = pas->dev_id;
+	new->generation      = pas->generation;
+	new->version         = pas->version;
+	new->peer_tx         = 1;
+	new->prev_spi        = pas->prev_spi;
+	new->prev_generation = pas->prev_generation;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_assoc_set_tx(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	list_add(&new->assocs_list, &pas->assocs_list);
+	list_move(&pas->assocs_list, &psd->stale_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
@@ -312,13 +359,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		err = -EINVAL;
 		goto exit_unlock;
 	}
-	if (pas->tx.spi) {
-		NL_SET_ERR_MSG(extack, "Tx key already set");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	if (pas->tx.spi)
+		err = psp_sock_tx_rekey(sk, psd, pas, key, extack);
+	else
+		err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 
-	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.52.1

