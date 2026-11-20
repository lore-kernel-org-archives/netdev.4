Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216447;
	b=Qm1tg5KGghkb3+S5YedgtcVKpu4lQer/YT5kboOhWywyLZyV0AFuIYsFhIvbHTBmarC4
	 BYzmsufPmwS4sNwrLp3LqOHCa6H77S5MmIQ67uTDa1Njc1QxUPSKJZIVEbb0onvDBWRMu
	 Gl/orlQeFaGRiKROVa1lcD7DzDpXfUg5/7ppITldgAFJFCXtKUqhsBG+Nq9mhzCxOtyDr
	 ckLEsNNLmr2zrQjUxRp8rlFHIpH9iV2df9xFeoWEBy8E01g1dqlhYvByrW/rox4wwxRXh
	 b8UiHx8b+33NpcfgHC2fCWTXgrY2BHKiSMCgGzODMI8f8oDT7oZsHDWtzc43wrST2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
	b=o5dm2uxRFS8XGElf077Xf7dma4JO6/YOd85lIC2iCr1wXWNHImURlvbRFTPPISBDcgs9
	 8x9g3f24NSJWVRdZjGs+7rZSWX8my+w+BkLu6bzLlS7frTkNsA4F5kyfNVsDwFGauYUo0
	 1q6gwx2HR6CwOlMIRsDs5pNnAbnwdfYUWMB0YY4HrcI3Iw4Ww8tPgCzNSNOaQPGOHcHJZ
	 ROCsTjTks+akJWeSYqP3U5mKVi/9oOVWeOcytCJ/gpoKld1eI2VoaIxlL2XBufmUpFaCm
	 vOeFQA/ud1bVImqKo/JGG6h0hNM1gBb/Mx084n8z/v7Yx81dGPq86FeYiE69+zmvNKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MuZh3eT/";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD25F606A33B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD25F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuZh3eT/
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so794512f8f.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216443; x=1795821243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
        b=MuZh3eT/vZxJJ/N89NPDd5NNty+NyzEGy7GKK0yySN6e/qsLHlQsHAJtbF9v7ULWyV
         7yqkHgJzD/+gL3YbrTL0nn1ypGlsmkO162LbIOZDykZyzWGZ70N1A11uRjrnH4l+V8Og
         XXdRSv5nEGEOatS5j5PWmZ+W+bGC7MPRLOt4IaaDdRUIX9kR4KdDYRaCzogDSG+1bihL
         iDhMDU28Ut5bAZBNsqt/0JS1NY+VVDO07++ELiy2qoMuDvTQOrvtnZj69y0aJy5oPIED
         3KcctILSm4VfDr3tPl0uq4adrPLY0GnZNoHkcBN8zrmKhQxc7hDho6jjgpq29oofmf9U
         fY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216443; x=1795821243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQiSSUnkgfdQDioXSaElBSsat+w/04YkyQNDvuI8C3M=;
        b=inpWNEochTgCFHPMpyzoTBYL1K6bntcgo33CpoBLwcNiIWN5ZoD9jlWzk4FTCT4Yt4
         NwTuPV8DrcJh8esu/hRR2M5va+KonxHekQONds0NH/Gv9Z5URW7SWBrA77ZVrCF+BLdc
         S9On1ujuUN3mPxFeqbo5JuX9pakx/aauccRsrP8pu6G5XgYjr4Qf+kn8eCuEmGyGW7YU
         c6byVng4aAcSB3/vett10Gs/EzEK0DKpyMipOR9HYtPugr5ChYz1P2zh8Ra1s27ExXq9
         fUrZJfE4d9YyQTp8IiIdFPkT/M3fUnnKNNiU2y1e9sAT/YQbNYYIpfqamEl2ZxUw5E6E
         A0Jg==
X-Forwarded-Encrypted: i=1; AL+hErGtpXUc6kmTleBNMZS+bk4gH7Rt5RdGiWoVYqG5/Fl5vdE8JtsERtWuMtimQ5YKBqBgS+juZLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qiNy31gpVBZ17PbMQN5CsUKcBsuIilGNyyvfbUD+/qFn9j4oC
	09yQr8SYVFWqe8UTzuID3Tekr3mO/6kNE+DH1JUDUuX6+Soz1TJmc/0=
X-Gm-Gg: AZFdTZeaH/FKZHT7mQF77qM/x/jQImFN/WPjapghyZmMYXDbjzXa8TGIgPuufirZN7G
	8+1AbDu2jm4JniH9vpC7ZiK/081fCnlRsO67e/uRIVVJ50dAI8aKqvjaceWZ2cjTGM5jAwtu4YG
	6JU0i999vid9TS+ylrEUkB/vjJIdBtloFnR61WeEbTeVdeke14LrqrAD1iKO9GdenUlGMKrlqMF
	wCPDn9qfj9KjrRmEYRzNzFcnVgfzDJhZMegLfxHuFAEWFpQ+mjoDz7fhhQxW/DW3VYw+d3B1kBT
	rXG8Uf5+urHJZWzZmMvr+JsSXqZ2ChrH/fahQKSMa0xg9R4svCmypCa6lxPhTzP80Z9K5E6dohy
	S1h6RSylkxKLWyGGR2k6ALGzAvKjaSdWpPTLZMZ059eEqt5h/pjZ5Vkhv/+7mNgHTuGK4nX1xSe
	uOk0t0LegOwKXysEAIxwRtwskrrihiLn8ETnVVE3WYlWWRztO9jxy8ErVx6RQ09EA4xs2WKZrJT
	q9sEkysOuU6L1HYXl18NPqv5KLhI6OEfpRm1gsCgmnFqlg2WADG2muvUbY/Pp4TGtgL2qKpO8l2
	QM1wxLGFsbRznx5hZ96RkKiwr4V7
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id ffacd0b85a97d-4ad269975e8mr6501403f8f.39.1795216443071;
        Fri, 20 Nov 2026 15:14:03 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm8151832f8f.58.2026.11.20.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:14:02 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net] net/sched: cls_flow: pin file with get_file_active before reading f_cred
Date: Fri, 20 Nov 2026 23:13:54 +0000
Message-ID: <20261120231354.1361803-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

flow_get_skuid() and flow_get_skgid() read sk->sk_socket->file->f_cred
without holding a reference to the file. Since the file slab uses
SLAB_TYPESAFE_BY_RCU, a concurrent close() may free and recycle the file
object, causing stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials and
release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589cc ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Use get_file_active() instead of get_file_rcu() since socket->file is
  not __rcu-annotated, fixing sparse warnings (Jakub Kicinski)
- Include discovery method per sashiko-bot request

 net/sched/cls_flow.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/sched/cls_flow.c b/net/sched/cls_flow.c
index 2ef449706638b..8653e6fdcfa2a 100644
--- a/net/sched/cls_flow.c
+++ b/net/sched/cls_flow.c
@@ -17,6 +17,7 @@
 #include <linux/ipv6.h>
 #include <linux/if_vlan.h>
 #include <linux/slab.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <net/inet_sock.h>
 
@@ -208,10 +209,16 @@ static u32 flow_get_rtclassid(const struct sk_buff *skb)
 static u32 flow_get_skuid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kuid_t skuid = sk->sk_socket->file->f_cred->fsuid;
+	if (!sk || !sk->sk_socket)
+		return 0;
+
+	filp = get_file_active(&sk->sk_socket->file);
+	if (filp) {
+		kuid_t skuid = filp->f_cred->fsuid;
 
+		fput(filp);
 		return from_kuid(&init_user_ns, skuid);
 	}
 	return 0;
@@ -220,10 +227,16 @@ static u32 flow_get_skuid(const struct sk_buff *skb)
 static u32 flow_get_skgid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
+
+	if (!sk || !sk->sk_socket)
+		return 0;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kgid_t skgid = sk->sk_socket->file->f_cred->fsgid;
+	filp = get_file_active(&sk->sk_socket->file);
+	if (filp) {
+		kgid_t skgid = filp->f_cred->fsgid;
 
+		fput(filp);
 		return from_kgid(&init_user_ns, skgid);
 	}
 	return 0;
-- 
2.47.3
