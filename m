Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738609;
	b=AhK2BWhrh5UF/euUBbdkIydScMtHrKEFUW89t/BhOq6CDvnlnhQLk1zhIL7Y/mlWI2fd
	 mpTZuTnNHAbdoL0AHOG5KEV23lev96+H4ltr6zvwTYJeNvgvrfhR/dADqrpr0IZY1UyXS
	 9w/50HURAaoYUL8taA53igakrtXfjsgCYNzUrlzGeKy5JVBSCVomkYA8ZAJ45gOge7d2B
	 G7eUWail2mxSF1TPCcDIx86xjBV21tevi21N4CCYJRfeHPuApok+FlSGNPAYeKICgAgWl
	 pEsnf2pmQSUBLHh+vv1RwkV6j9MNTI/kHsjl/oMMgs8D3uNPH/kCdCYqQ+q2ZuB4Axg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
	b=DCj1KkRy5Oy9eC5DKTnaATO7tSphd0N1v3eAfU/xRGkzFTY2zKNh6jqrF61KEGcAfOoL
	 rL+CEYVTrWkzoaYdrxsbvf7At25XeJ/u8WMniZWLxStjhaYLMjuvvDmCVN+owi7qPZ8Yu
	 TR0a8YlpkwbI8UMKybFT/5wVUMsiWQxJD+IPcAsQw2h5Fx29hBn9YI+GmUBL+He9Ier0w
	 FKgUCaMa0ydaMAqe0tLhCoj2fISU7XEjK7j6wylzprLUsZXydYwEsI0h4ROA79JaXFLy8
	 gRps3xx1oN/looEuP6d8JkCaK7BA9UjcWi/jGgl8iYkAMZWUbJcQ0TccK5d0MOlqXIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYO8aFEt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF042606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF042606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYO8aFEt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so49246515e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738607; x=1796343407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
        b=PYO8aFEtgcaK2RPagOerewhpmmc0ZDfIuCpod+G7twgg2sk8nOtwoVzXqiOruClPIm
         ykZa2Gxh+SbdOb03Tk7Ecox+GJjbV9l2/iELPwatOZLCW6UmJZa8NAe8B/w/TKjjd6pb
         Z8lDEzwMElZT3VuGrs7870kS2fZ5W6L3Y1LHKxricIzTODmmgHGB8yL32QZKvtgZU/Ea
         c/FH6xopP1GpfrAy773fdIGxTM8VNlJBn431gWDOYNXBHbqBmwGj7RPl1BwxdeO7uPEu
         JszKhsTKy2u/qCKbWkAQnfWQfdvyXVGBNEX4EE1GUhwSFa4Z8PJSs1cVbio6w2uoB1CD
         pzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738607; x=1796343407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npRlcaBUGO4zBESfN/npXWj8+rVH/w1YcWRi93JmvYY=;
        b=uIz6fQTjkndAzjhk7lQeEaK7cwJKbO+Z9CBpn/Jv/MiAQluyL6l/eDyL2gkIKZB3lP
         SdPqL38svH2WzJxfnniArK1JbAp5V3s7sg729pxsZAkONYlE3Q2SCw/B+kXZnLbWKd8P
         8spUcvquxihroFHxAzfK4bxoAPrMgBhYDIu5icKonvSRM29D46MpjrAjXuaQIn/2vsEn
         KuSTgENaaNCUuEEfW7fpog46nq0AoESpYThJxlaRQh7glJYvGWQLbwZ09MvIgi+x7654
         Gqxi9GbXJG1AKtn1RzDzDQci7IkWPzj1+9CUllFzoUWrSnPJZB0s6P/4ucnb7elwf2jl
         YpYg==
X-Forwarded-Encrypted: i=1; AL+hErEtyYhGy+8Jk1/qd5i4lJ+1pHgzgvDsnlNI7JgSTAj8mKUYcpGLClU7YNWZmm2KEMHSvo2qCsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OUd+//r9vmTaWT3vYeYJLYJiY2z/161MQ2agn+82XIDBrJySx
	rNoNNgl/eBStN62f2cp6AqF/z96J6v2cED5aTjnnDFyDYLIh6qd+cUI=
X-Gm-Gg: AZFdTZd58wN9X5/yu/vzk26mIjS7K9fDwJBsgahHTjUSNNve2hfLkxRJN0lBpkOhnE5
	MWFQCRvBzHqLgmy9jaMaUNNPvp3u7lrBlUjDTQEBEN0XiQvijxX9RCVDarYxdLtGmU3aZjTStQG
	PjI+qios3MX4dLEsS6mLCnNa4anzZ4Q2+Pb8ZwJc93DenX4A0sAps14dRkFvLS8QoCTraEJQx5R
	YfAyIHbaslVlLO1vh0Cqlke748/KZtLyNnT5FKeXUSCgcfY6Te5bHz79uKdUy4pCpowwgCv6WDp
	3Ar1Y1Jp3pFWrcmtSxc16UB6a6LbOBLdxMN+VaXyf7S3UagTqnMXDhgE4SI66hqEtSvBnZLzGMh
	dKosUCa9TiOCpihQGkkwbf9Z/30LYJdghyXO6tFRHAif7FV5ksfobxVVksOUCDMXKLcc6HqHWc2
	za+elujdE9pu4R6oTsGV1tHS46Df/8kWUOT/gzDrhNFnaYS35+BFd18nU0ptSS4yp0dwqjh9HLT
	lNw2e413VDttt9cRfESH9cWJeyUsIC5IyjZ6/rou/2qfjpc2mDG72TpV38CplruiFiCaCY9kTMw
	UZstQwNasifq8L8=
X-Received: by 2002:a05:600c:5306:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb887ca0bamr418564775e9.3.1795738607398;
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	Christian Brauner <brauner@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 nf 1/5] netfilter: xt_owner: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:33 +0000
Message-ID: <20261127001637.1026589-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127001637.1026589-1-tristmd@gmail.com>
References: <20261127001637.1026589-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

owner_mt() reads sk->sk_socket->file->f_cred without holding a
reference to the file. Since the file slab uses SLAB_TYPESAFE_BY_RCU,
a concurrent close() may free and recycle the file object, causing
stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials
and release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/netfilter/xt_owner.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/net/netfilter/xt_owner.c b/net/netfilter/xt_owner.c
index 8f2e57b2a5868..75fcff0ce21aa 100644
--- a/net/netfilter/xt_owner.c
+++ b/net/netfilter/xt_owner.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/skbuff.h>
 #include <linux/file.h>
+#include <linux/fs.h>
 #include <linux/cred.h>
 
 #include <net/sock.h>
@@ -65,8 +66,8 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 	const struct xt_owner_match_info *info = par->matchinfo;
 	struct sock *sk = skb_to_full_sk(skb);
 	struct net *net = xt_net(par);
-	const struct socket *sock;
-	const struct file *filp;
+	struct socket *sock;
+	struct file *filp;
 
 	if (!sk || !READ_ONCE(sk->sk_socket) || !net_eq(net, sock_net(sk)))
 		return (info->match ^ info->invert) == 0;
@@ -77,14 +78,13 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 		 */
 		return false;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	filp = sock ? READ_ONCE(sock->file) : NULL;
-	if (filp == NULL)
+	if (!sock)
+		return ((info->match ^ info->invert) &
+		       (XT_OWNER_UID | XT_OWNER_GID)) == 0;
+
+	filp = get_file_active(&sock->file);
+	if (!filp)
 		return ((info->match ^ info->invert) &
 		       (XT_OWNER_UID | XT_OWNER_GID)) == 0;
 
@@ -94,8 +94,10 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 
 		if ((uid_gte(filp->f_cred->fsuid, uid_min) &&
 		     uid_lte(filp->f_cred->fsuid, uid_max)) ^
-		    !(info->invert & XT_OWNER_UID))
+		    !(info->invert & XT_OWNER_UID)) {
+			fput(filp);
 			return false;
+		}
 	}
 
 	if (info->match & XT_OWNER_GID) {
@@ -120,10 +122,13 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
 			}
 		}
 
-		if (match ^ !(info->invert & XT_OWNER_GID))
+		if (match ^ !(info->invert & XT_OWNER_GID)) {
+			fput(filp);
 			return false;
+		}
 	}
 
+	fput(filp);
 	return true;
 }
 
-- 
2.47.3

