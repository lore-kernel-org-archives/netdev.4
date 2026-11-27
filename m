Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738611;
	b=Z2VR5P51tX6tpctS+EjpVbmR+ANYYfr2OWCA9CgQcevt7NY77ZCP24XKEQmJzTGUHBpn
	 WxaKgkWubJVcBRvHTZWD3gSHNjTTJNIUgeRIeuAsHGhT0qTFVcyUfULFmUUsUQBBC2kiv
	 m5Or1gkteDqhoc2J0GSK4W6Nq3c1iYoCAQyyqr25AHB/xLGi+Grq5M+d7TZrZmOqCFL/e
	 tH/EwAeA2pQCg+xjY8M4xHv63JwxGmymUWeL4c3WWCE6hN1M9XfDz6xeUAjC+80OZkZub
	 QKxMF83Ko8p5NggPfJvkFx19cAQ+5K5t1qTPM7gVU2E1+Rg9jC16QKX1CCceJUS3j1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d09q77CW+vLOu0h3yXJDzaOaqLHW3peCBQAh0XhX6Zg=;
	b=ljLioys6YW9UaJSE0aWrmh1LFQyZxlXfcwS9gyjcJwijt2WnE4+JiEomS3hPGC4DcD3O
	 6U7TB8bOLwvt/0o1rBCJgxspU1ogaZijXoMmBmCyVY4g2FkC7wSsM7YOMmnwACAW64jpz
	 mZCsl6jtcjW2xUqLM0z4b6B/HPfwZooF0cJO7sOjWpsqX5R52utIVH3jzQFTX8Kzv4ZRC
	 Uoob1+tXhBnVDMfIc0/QWjZmgpCk0+Lu+mixcXky6pk1VyJDehPnnjC3KH35BFY9GWBdb
	 hO2FuUu5zFW5aP/NXbgOjGAnBVnjbB5jUFtT+9QYQKjwVC73nkNGKV2AFYHAYtV9aNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3+gfUgL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C264606A6A6
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C264606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3+gfUgL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so80420395e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738609; x=1796343409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d09q77CW+vLOu0h3yXJDzaOaqLHW3peCBQAh0XhX6Zg=;
        b=D3+gfUgLoHhmkjycLbU8ZDWQECx0FNnNAudpkYvjpTYaKXacBhxhxE9hkG0UIi88ik
         BWLbgdFgEwU84Ypzy4/r+3Hx5ruvMwSTI4vYjog8bbq8F/Vgn0ta7ZDNVFH3PWmKNrhy
         7txK+TAQNTQ3L/1w0Sl2MWPgZNvUB+VQD6E2ruo98DRv6a2lNf+XqKmm09Vu+vCl/ILd
         S6rvS/6D3pngsAqu5p1SklS0Ruq99aWp9/xID6rq+eTPivnTQ7xbuDeh3cHZH8kxnD1Q
         txx2BpxSAyyh7+hvs3xSAUdfJZLLGgIv7KxxnjbJ4DkLczEhiFzumSA26VFI2YFfQklx
         IY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738609; x=1796343409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d09q77CW+vLOu0h3yXJDzaOaqLHW3peCBQAh0XhX6Zg=;
        b=dDxPdrIHg7Zv3HJO8kGUbH77Y+6kyjE4olqHebPf5zkptCGoj+PPbE3hzdSygLgzSc
         BDCjjQB3XwciG9JlyTAqvzB1hyCOzabqxmqSscDA3sXeON2fhB+cFQdt94V2HYwOqjDI
         dsRkaa6R/6HxHkkpzybxCdSQQ9xvRuw9PCRWYi/AR3rMpMd/EMGEvjrgwuiA+Y1F1R8B
         Fk9T3SfWzUcCPHceb/wId5HgWacPxzCXHnVEXiJv6vGqfH1fPfUB7AmbHrnXRyqD53IK
         EAFrXTawUMRg6jyLbBQgc7rkNp9NIzmcsZLHn8Z5E/hFXuxPnRd3jgKRktKOBSe+p0Pp
         A1eg==
X-Forwarded-Encrypted: i=1; AL+hErF8J1GiIBy/ASPRSQElqRYUwFIFjOpWGr6rRLveMSMEHkd4eA2aDhm1zUfmG1mUdGH/m/G7SH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5f7FBP7bVdKPlBX+nXXrIJIxiUZPf9d+QIFuUR8lE8zn+sdy/
	4xF4sR9taTiPbVO8cMqeOTN4UAF3d+W42T9N1Ha3X89DTADjSKWfSLE=
X-Gm-Gg: AZFdTZcNO70Qb1ozPz48L8lrzkxwnUDgtQ144xvcxMnXY8sG1WXQLlRM/tNTa2Cl13B
	tofHLHxXAllg+6gYaS+RBDIzHLvm51eZ4OpZuC3YtIxnoIiIgojYWZv73vj1dwA8vJsiJNupvfU
	WJBGGadd/uxKZ8CTLostLbl+jwZ8fIVcKVt6M6K/KydcUY4e++NQ+9APgJctRo9gnisRwAoxi3A
	Lib2iVVJLxJalSh1veEZTTfe04dyo5OTfCCd4/mjqTjRgPpzA5AxZR6nr7WLHjc/534XDjQGnYf
	z7CExDqiJAmx6P1cdfTlJym4J5pUPj7JxnGyvWz0aj9q6kCZF5Zd+66azfpeta7YsFRQVAuVrSq
	RqhErChDYBWRjGWummGxPb/v6y/DRt9pG1Gx28nP1UGdKI7k5RTANI3pu0wOASJT8fr/UgQUekY
	IWTlTM5kva4uwVhfNfBgI74IauWpVg6MoyryR7LNxTSuhftnRUXtVV1/Qe6JfnZHLoEsObXLgsy
	/lriS5zTpXmsOpdJWUOy7V4btMNB5nxNjxS4S9lO+0KOHWBrjvlPYA5NMA46Ah85MucIdHlm6CG
	dob+kBbD39RE8Bw=
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr450837465e9.2.1795738609068;
        Thu, 26 Nov 2026 16:16:49 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:48 -0800 (PST)
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
Subject: [PATCH v2 nf 4/5] netfilter: nfnetlink_queue: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:36 +0000
Message-ID: <20261127001637.1026589-5-tristmd@gmail.com>
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

nfqnl_put_sk_uidgid() reads sk->sk_socket->file->f_cred without
holding a reference to the file. Since the file slab uses
SLAB_TYPESAFE_BY_RCU, a concurrent close() may free and recycle the
file object, causing stale credential data to be read through f_cred.

Pin the file with get_file_active() before accessing its credentials
and release with fput() afterwards.

Found by manual code inspection; not triggered at runtime.

Fixes: 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/netfilter/nfnetlink_queue.c | 35 ++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index a8aa7ad832c3f..7a31267ae38f6 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -22,6 +22,7 @@
 #include <linux/netdevice.h>
 #include <linux/netfilter.h>
 #include <linux/proc_fs.h>
+#include <linux/fs.h>
 #include <linux/netfilter_ipv4.h>
 #include <linux/netfilter_ipv6.h>
 #include <linux/netfilter_bridge.h>
@@ -578,29 +579,27 @@ nfqnl_put_packet_info(struct sk_buff *nlskb, struct sk_buff *packet,
 
 static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
 {
-	const struct socket *sock;
-	const struct file *file;
-	const struct cred *cred;
+	struct socket *sock;
+	struct file *file;
 
 	if (!sk_fullsock(sk))
 		return 0;
 
-	/* The sk pointer remains valid as long as the skb is.
-	 * The sk_socket and file pointer may become NULL
-	 * if the socket is closed.
-	 * Both structures (including file->cred) are RCU freed
-	 * which means they can be accessed within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	file = sock ? READ_ONCE(sock->file) : NULL;
-	if (file) {
-		cred = file->f_cred;
-		if (nla_put_be32(skb, NFQA_UID,
-		    htonl(from_kuid_munged(&init_user_ns, cred->fsuid))))
-			goto nla_put_failure;
-		if (nla_put_be32(skb, NFQA_GID,
-		    htonl(from_kgid_munged(&init_user_ns, cred->fsgid))))
-			goto nla_put_failure;
+	if (sock) {
+		file = get_file_active(&sock->file);
+		if (file) {
+			const struct cred *cred = file->f_cred;
+			__be32 uid = htonl(from_kuid_munged(&init_user_ns,
+							cred->fsuid));
+			__be32 gid = htonl(from_kgid_munged(&init_user_ns,
+							cred->fsgid));
+
+			fput(file);
+			if (nla_put_be32(skb, NFQA_UID, uid) ||
+			    nla_put_be32(skb, NFQA_GID, gid))
+				goto nla_put_failure;
+		}
 	}
 	return 0;
 
-- 
2.47.3

