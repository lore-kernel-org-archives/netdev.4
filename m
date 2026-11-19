Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106680;
	b=gTQhXG7jMfZjgIelM3hHY5J5e6UGWOVK3m3TZZ7e1sP5nSL5yKLJgfED5SICCtkg5mSb
	 Us8euQqQ0idlRRjjQM3BncB4QYCbhklHthlOsbk8xTU6a5L7Tty7VPlTPXenrc3YQnzZG
	 kPKw8WLop3htaL5OBjqRYFoZoiLO3Z2cFzXgwFFklWx7fzVkwEft+kpV7D8mx/nb+AfMC
	 wrsBHyGu14hqbN58Uqc3t7mQZ/8mWf2PNTfJEr/fXzW2cVHWN2gZRoPIt+yIzJx2MhKTx
	 NWcNQIJwoKIdvC2dqkmrvuxel86J8qmRLtrEU2Xng3H2PlD3uil+fo7gYOMeJrHnMfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
	b=gEzEafmD8OYaxQcUduN4iMHyVk3zA5eC84+img0mAFjQN7qgzGWFvtn6V8ByRBRRJj9y
	 SI7ATKfbZ1YcTwDx4wYUUx6nlb7oVLydtpSd5YOEfI82evF2TtqIyFyhkYcHOtJDWVxJE
	 emnLox1UTxqZRmrMx6Pj0h2PASfkaYpr0bEfGEbKtUgpYg3ELdAd364+E4uv+cEHcLeGB
	 hdjaZ1FrwvldV5VcKujORDC6p70lecXHfkLvxWRU3cRl+nkmNj1nM9Ja0o4BGriXxOXI+
	 Z9viNAUXBT5eEEVnJGH+TjGxSH+9a76/9iPiCbXPbKs/BT8qOlpVwnPg16lJ4M1j0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7528C606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7528C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070755c8cso10125b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106680; x=1795711480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=RQ414flIVmuB8vvRnrunHccGzUqdPpcgcwYaLUZ6H21cZDBg7PY2aTLFXnBMsHoMRd
         38tQFlsbfGyeJFasCda8TvHb5k5Yvi/eVOjKqNM7qQNDa3hXTfeZ7txKRPwllccKZAZ+
         FRFGP4cpEees7vLq/ZIQ4DL6p/nvsxpC65XPvX3HaXYsMYWCy3mL3yO4hfJ++wq26riK
         PzQr3/Q85tHXTcKb0MXJryCgzxEQHlAxs4Uy46E9FmZeBuO0pNGI/D0lRYRDvGiQ4L7p
         7RTF/IwJvehvOpit9VUNGo34pB9FwZ8tpKR6VsVGdtr5JL3ZJGnNQx8rLlSW/gNIZGh/
         HHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106680; x=1795711480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=AzjUJAmvXkOkLND6qQxMLpYGVzuUkm6RpZ5Fkw2FX51ylTivbU3yxkOaMIshhHswd2
         /6bCqfuiwCiJof2Fgp5PPmkM9yICum2mArVXFyZbWcEUJrk1t/hqtbJYXROmcX/LFzA/
         NSPBZnLCWCi7ZIWLNzmoXEVlCoVZXu/jrlHemogsaevUIcgchnmpe4cQaugYZ+xL4ggx
         q3njUpsu5Cu6cjseMWX3gD2j5DOa5RarUcTxsQemXE0yflOgQc0k6QkJiebBQuERXfU5
         ZuU3yFJFuUFmuz69a4RUILc0RQClC9Y65mj6W8l/9m4eFSKWWoAXWejn8fKDrg/EU+y+
         BZVw==
X-Gm-Message-State: APuU4Z/lVEzRUB8iQflcdh++xFm4Wus0An+zajFVAim8gofRmSDBTxkG
	iEtKkevRFZQVIS+bz8ZnkWt7TtwPIR9vwo6QP/XiwgF1Fk/BvvNbBcV/i0mnGQbFbc4=
X-Gm-Gg: AYBFou30sTKSEEVxrJg5O1Wz9jz0ZJW1ryynuJkvMz3mtLNToY1bN6boF+osHACQR6P
	ldFGqRW3Lb2netfLQj6UQvOkT9+70fDn+ApqOv74XthQr4/ViwoU6SeqAR+Qb7aqbVsnTP+OWTu
	O1oi6KpC5teltBOuIp8sTRzT9QJI7TEWQvT9Y3yH83BKeAGDZu8WpvBv5m0ceBgztX9vcclGbQ/
	Hbv+klBo6Ibn0b+QnTeRshKFRTuj5yxqo1O6f1kumPQR/xunxOSyuelkOAuSny0GrgKoBhv8K7r
	OJLdjEAkLnNTn0HW7F/reXwq+QVI8TtdjVQo8x7oekZ3GdX1nkphy9CMwsnH9hxYZH83zTgvSFM
	QshRIK/yNyGfs8ZE2lDBWDn9CYnoomkAbCmVFL25JDmJQ3knyrOxD/fGw5NyRJ+F0mqm2Nk7OLH
	vJC/aRkJZv5V48dJ1NE2P9OLou27h9z0pBsAY/awOg15BjVamGZBJmY7kd/wJ6FRx26skIayba0
	3GXphJIso3F4iKfjeC9hn8TlPHiNTL7ad1Z/+fFMIruzw6HjSMn92A7qOwSF6a6ZR3tD2WcWNZ2
	B333ZqxTSusoEc6d+phB+Ko1m6o9XbfG2kW5jlvbEAbMWu7u6bd/oJywBIw=
X-Received: by 2002:a05:6a00:1f0a:b0:881:9f52:ca00 with SMTP id d2e1a72fcca58-8c87cb4b0demr174911b3a.42.1795106679710;
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45736sm173790b3a.25.2026.11.19.08.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
From: Sangmin Lee <45sangmin99@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] docs: networking: correct skb_shared_info field reference
Date: Fri, 20 Nov 2026 01:43:11 +0900
Message-ID: <20261119164351.49040-1-45sangmin99@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The skbuff documentation refers to skb_shared_info.refcount,
but struct skb_shared_info has no such member. The actual
field is skb_shared_info.dataref.

Correct the reference to match the structure definition.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..e66adf19a 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+&skb_shared_info.dataref indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.50.1 (Apple Git-155)

