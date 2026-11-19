Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108213;
	b=CfDNAZ73SvijGx9TNhr37j71t99I7oS5wIQ5i6GDgQbedWeE7yWKilwbF3sl0lmqbKmY
	 G504GHqKcGivlxYGXCMy+f6OBsRI8vi4UG0wFL+v9RRx6gHeqzIxeV9OFGFQumwnJI3KV
	 +t4mTn3myB+cMZnT5Iz5S/WmmZSECwDVDFcAfQYJ1YkUm2ngK5WXlzhCGv6wfbdujJdrl
	 F6L8if5LpA2zSTYmY10A0NuR43m30nVWfJPPPLna95NBnENWwzVFoObbV8IOLAgVWV9nF
	 HdCCDaqkQ1eDFgayVD9Fd0WdD8GExcB3fLBhEvuiq3QLeOAtTrZxEkHn4kVJdkFAlVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
	b=fnPb4kOFZ06OFkpSQScYt3yHem+zUVax33ywb2C7wDoX5qAh9Objon9Y47U3A+GVLmbh
	 j8cSONSYUrTJ/OUTSUXFGz4nCZ/HwtICpR4vlVozALayHpwOcVi9xgH1TK51PAJKCLSEy
	 EZgcLLGXwEqt3eVLBpu9xXKvXwsAy2PotuD5KVefPGIvlWpfEVJNvOJ4pAXUniNYmsrBI
	 e5Wrp2+yvI5mQ/RUD3TEaUgz1KjaomDasarGqu+QRTPTzDwik/wjPDohLcxv3eIloufkZ
	 U1XkvJ6igpC2YOWOsDANk6RCtqnLSYkvZ5r2vtq6w/zr5cQYxFDrCdBh0NOk8yhKdsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APto1++M;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4DA60A3812
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4DA60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APto1++M
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso1985266eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108212; x=1795713012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=APto1++MH6zID2YiOIjGdPc30YAe8iKYKxfkWDZASe0I+ni9w/i8pamAjSFUfIOhWO
         4qCO2k0LOJoC2iOOShxRGjoOI2hjImjjMj22nJIGuDU74UojWU5pXKGHtnlRLZ8j8m0q
         kyBC4KSjRWhfs05Loyy4bLmIK27sWhr5vVk6nzBSNh3EC2LdWCeg93ffUHQl8TZ5Atr5
         LjC+YjqZIvHtEaZ2LwzwhQ2fzQ3Fr1HQsky84+VT3puTIZXYJM8HWHe6TXtTxUdZY1O5
         HW8oQIlQfeMQfzd03ZJPoB/oqYVJJi3iyYjbC0JTR//bxJiWKIR81G+lruMv8v3J+4k1
         lv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108212; x=1795713012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBfwWR6KMKvY7bdeIiCHUu6wQSmNF3ekT+F/c9nKQ8=;
        b=KqJQu1xs9gbNnOLC5e4wFDxTOKfTligsb5BrVDWdC+qXn2IAP6YPAD9yBb+8sCKlDE
         wMjyysS4ZteQcHF7Ee27j8O3Yfja3xO0rJRil1MqvcRwuMTN1XFcvzVwMzlS8Z8fioH4
         K7aiLjSQ+B5ztY1HeGBJ5Lz494u8Qhuk2Gcrab1zRtrOgycL/wZbpSU+oS59C2M6UveO
         8gCIsEL8f92cHPlPZEzM4bPHP70yWyL6rAMf3z/NiCT4I1NL8Zwb9wh4wn+G2/WjOuNu
         5/LHDEujjgvbob5A7R4poBzuDxlG1zqtemKxlHPtzj7NdmcdIKk/wo4yDxIqrOYWspsy
         M6IA==
X-Forwarded-Encrypted: i=1; AL+hErFv/FvKd/tq4gXnGwXjqtX5+fuvNCK2rnkIt63ijf9Pdi7n7cbuKEY9oFY76lg3wPH9XWayo+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hyu+cQEDXCRC8igY7dt5oFu4QUIEe93HKewShRWxAgu/MkEtN
	JSYCLRe19bavUlXmiS4UlKmpcUP1/LMyWyGEMD6yKiihGQFDKSJJSsDu8dWkSXNlPjUJ6XnaMoI
	Zf9LmEY26dQ==
X-Received: from dyckq13.prod.google.com ([2002:a05:7301:7dcd:b0:383:aab7:cc58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8943:10b0:381:cb1d:466b
 with SMTP id 5a478bee46e88-38280d3068emr5688589eec.26.1795108211935; Thu, 19
 Nov 2026 09:10:11 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:09 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171009.1534335-1-irogers@google.com>
Subject: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
From: Ian Rogers <irogers@google.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
last VLAN entry in that window, list_for_each_entry_rcu() executes
zero iterations and leaves vid uninitialized on the stack. The
subsequent 'if (!vid)' check can then proceed and program stack
garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.

Initialize vid to 0 so that an empty RCU list cleanly hits 'if (!vid)'
and returns -1.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building net/ncsi/ncsi-manage.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on NCSI
hardware.

Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/ncsi/ncsi-manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429..f7eca228c281 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -640,7 +640,7 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	unsigned long flags;
 	int i, index;
 	void *bitmap;
-	u16 vid;
+	u16 vid = 0;
 
 	if (list_empty(&ndp->vlan_vids))
 		return -1;
-- 
2.56.1.708.g77570a6a1d-goog

