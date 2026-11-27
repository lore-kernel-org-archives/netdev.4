Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738612;
	b=3sHKi6E0wzcD7SDbqo7UZHNjTmuSd4sk06OKAgfPu0WMgLH972OjtN80MwJinuB3CEPo
	 fopkcp3ucRWCduwsfuWTMi8goZXK8/nh09olJPbqSuhq2jiHYGCXQ4UXzeyHaNopMs4u6
	 yR4liX0v6hC28Is7JhFRPzUlQUy6PQzU+k29PcX2BKJJaPkIpNbNQ6E7Ofam4L9ONgpnp
	 8EY7n6ykJQBamPLtIjXa/Ou1HnXbXjdo/hj4oXYzEnm7+i8WUyL2mywhe/6oUcWxdOPp3
	 8s0HVtMXZdpm/N9UcIfHPCquk0rgJiWIwy6jML0XMq1VlbPrLONPbLW841k92oOjw2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
	b=d2GkgJZTPE0kJ5ew9rlftIIUN/ej7+oE7nzwg00Nc8XetrId1IdyccKv8Ks9u1SJOoWt
	 n3PA+S52PrqUy+MwcxrTGgkgfjz+jqD895yx0l6o5tgbV5T1eSEUFZ1cToET38FVVETfY
	 BLa8PQPL/A4JeioU0/uDvVhXmLYVjU/KGcWM91gC1cTCcfG2yazeBEPj5l3Zfx+tYLmOi
	 cTrj6cCLZDd7zoCwckG+ZmUB0Citv9bhlwu59n76lifO9asePU3Pr6BsBKA7uSysnRW6w
	 0wo9Azk6WU6BaBSgVlDO9pglnaXqoyDQUuRfOyNFrQfonZFa6i0OnN0gMFY4996/iMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T34DF08R;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4B60A2603
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF4B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T34DF08R
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so61472875e9.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738610; x=1796343410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
        b=T34DF08RkclBqCp86/pbXD7dB5z9Qafib6EkPNsHvOuXnehvWwaTdcE+BsNxucSDfN
         4XsiBrWPynipFk+C/A2q8pjqaO0JWTyO/4qFJJAfxRecIRgjZE9BV2rW32JTVL3RiJs6
         CX8H0ARMJMDU09Bgr7ecaj4f9gF5bLK14MHa8L/j7a2mta74dKOEGWGJTNr5Z5Rg45jc
         QxtuHA968TZBD/zSTWXWYmeCCxeo9TL9xLdX25vtHMOHZkfSMN/htrrVL/XHzo93Rguw
         RvX3UmmWD8IhqExnbs4ia/wPAQxDcfUQY/UHDbYdYmTaujoz6Ogq5Ui17UB7WdIOWdKb
         k5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738610; x=1796343410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRTP8FO/eHZGhtNodRe4fi46UFA5HdjhjKCVqbUUh2w=;
        b=Xw7xXrmIDdwfHdGLJ1rSmMMeaC7zfpcLwuG3G0lzt/soEcXqLMJMWbE9oP16xOSUOw
         mMMeKh+gsfcIiB1wz1fb/wxb1K/He3VKjCdJhIUo49XvJvBgKQoQaRHjEkWqq+ojbUaF
         Lw5uejdMsORfmNk8nD68eg366In+/WSfiBHGhaw5r6wAJLts1hjvjrdtGI1yr0YSXlAo
         l066c6dhqE5t0km8EDyazylKml7LjS2wbUKCWFicdXhu7a1wlOXaIhvbBQTRZXPalSe4
         8y24CnnegeqbGqvl0L7oHSS6z6dTPcUan7OUvp5HAbY8HwySETdFSVLVFxeggRt/AY9d
         N+SA==
X-Forwarded-Encrypted: i=1; AL+hErF9I233wohIznT41/jaa3ho49VJIR22aSbEU9XqjSNP5UQsDuVka+2xCyuaaOn/NrktmyFDSd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FaLl0Vnustkb9hH9zcTL8FoBORAO3O59JOcDe+3ztkatB/Son
	XdLVtUpv7j7wKEuXpLfOxucMNYV5g/QKOGFoWOcp2hfey/YyDFJWvGQ=
X-Gm-Gg: AZFdTZdRT086xT9QJEfpDoORFrne++KXCePDhpOhB0A3DpUIZDkdxfourCTY3vMI4AW
	rv09Yf05CESDLNfDicZhvO1oHMzdxOap7ePbAEjMBHc+B/ENfHuJ9qG6YcM1Ca5WugfCglV0A8b
	j/cUuxLG/x81IuiJg+w+zZQ3vHMdQWQ+hc87JWXFjFNYdAcG24JTB6/4aCV+aIALCv5x2GFhVGS
	cn5BU59XvkB6X5mw/sF8I9zIJ86vxrVNe0Hu6Bl+vs0N0IXP6090gvoAQ5co7u9xM47xUFp/RXv
	s7ENwupIPHQLlsS0Zk3UI2Vb09Mo0YLcNAOquE/+lkBcq2LmJmqT1ddunfsIoSEeG21EbK02Mwi
	JiZ6ys2+V/BBiC+dgWAOLH82+JFrdwVsjfe0r2woPZvaNA/OEhfYq8ZkKpY+xEp87j8T54YYt6N
	smSSgVKSypja1lkH8D/XBOyIe7HzAfMxGEJxsWkftrDYy89hjj7BGSFR+kPuPo2wtWPLgHKA8dv
	6EKV5EFpvO7oOO3jSawO3Mk2aCITxttQ4xrcL7qu9ijXp6u8XnTjVCXp9OEW74Rm5BYwRfSVHnf
	z14KkQOrxwAkSd8=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr434988635e9.27.1795738609584;
        Thu, 26 Nov 2026 16:16:49 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:49 -0800 (PST)
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
Subject: [PATCH v2 nf 5/5] netfilter: nf_log_syslog: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:37 +0000
Message-ID: <20261127001637.1026589-6-tristmd@gmail.com>
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

nf_log_dump_sk_uid_gid() reads sk->sk_socket->file->f_cred without
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
 net/netfilter/nf_log_syslog.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/net/netfilter/nf_log_syslog.c b/net/netfilter/nf_log_syslog.c
index c3fd398ffcd77..dd15409100eba 100644
--- a/net/netfilter/nf_log_syslog.c
+++ b/net/netfilter/nf_log_syslog.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/skbuff.h>
@@ -168,25 +169,24 @@ static struct nf_logger nf_arp_logger __read_mostly = {
 static void nf_log_dump_sk_uid_gid(struct net *net, struct nf_log_buf *m,
 				   struct sock *sk)
 {
-	const struct socket *sock;
-	const struct file *file;
+	struct socket *sock;
+	struct file *file;
 
 	if (!sk || !sk_fullsock(sk) || !net_eq(net, sock_net(sk)))
 		return;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	file = sock ? READ_ONCE(sock->file) : NULL;
-	if (file) {
-		const struct cred *cred = file->f_cred;
-
-		nf_log_buf_add(m, "UID=%u GID=%u ",
-			       from_kuid_munged(&init_user_ns, cred->fsuid),
-			       from_kgid_munged(&init_user_ns, cred->fsgid));
+	if (sock) {
+		file = get_file_active(&sock->file);
+		if (file) {
+			uid_t uid = from_kuid_munged(&init_user_ns,
+						    file->f_cred->fsuid);
+			gid_t gid = from_kgid_munged(&init_user_ns,
+						    file->f_cred->fsgid);
+
+			fput(file);
+			nf_log_buf_add(m, "UID=%u GID=%u ", uid, gid);
+		}
 	}
 }
 
-- 
2.47.3

