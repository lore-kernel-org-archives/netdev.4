Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738610;
	b=g4/Ait/YgBwk462rgkc7uWoMnxUXS1duAVICZtHiwS8xqOfSxu01PJjH4Upodjk+ghdu
	 VaxtArDYP+z6mmZxGBxGu0hrd484B515h1qK4Y10tYCnK5PS52uG1JApwfeWo9gr1JqVb
	 clHiyt55BJNihqjMAtYlxKXRYsS8vr82hytmBewoEY1hysQLg+RBKOLS8xXWN+2VJq720
	 HsouCmiQESNckbnyRot/KIwkKntI84NziWtoCgYOKNr72RWXS6ROGHnfhxJmOwPqzRFZw
	 2OaaucLVjPE4ZFzLfzPolucYC4B78jjVOZADvbHD+5fjvRI1WP8FsaaKIAJYTas+NsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
	b=v4EdE90z/LvFs6HuggYrJsGTmuHNuzy2m9OozmnAhJP/B4iWgBi6q7Tcm4W8JV5WBvrm
	 IdGCgIxlkwhM58g7Xjo/uN5Q11N9zzs8zpMatq+nBj3NO8Yyddeaaj6HOkBH+1dzoGQnW
	 Ju/rXtCDuaUIjHrlOvUbSmEbo4mtWj3GiCtvnWSK54uyFnX2YA/bKWp46/hARtjAeRbx7
	 iSkcgn2+75qxOkBYZvs/rrjWs1zYUj3//HWdQEPkYZ9mHk18rTcck3mLmNqrB3vVEalT7
	 KZJT8SBLDS+DtDAMD16iCoBZk51Oj8gaoJCueN7lQBS476Ff7ZiLF20TYMPBRvsJR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBThwLrg;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8286606A33B
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8286606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sBThwLrg
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4747135f8f.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738608; x=1796343408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
        b=sBThwLrgwtNi/8V+i5S1cCVxWVRMg+L2Y0aTjHRPpx8c8uWlF6atBR2a4U/9ViPF/N
         JPpZAwHvyB4+9tipx396YodjkCn+rOfe2lENaGPMNlBJ0GNCCehx/uyfqHfzRqdpFTgM
         cZRd1rPnlDFW3Hh1yCBYH1LINsqHDqMpBSNBvgHSHPFWMxvWohlyTz2QSXhZyL2b6z26
         M2sUHErEMu0C/DuQPOLPmluzICGiH2bVMJZs6cHx5AEdjCLX0As+kKmm+2oxoShPI3M1
         /R0I9yWT3Kl9v7nzj7MHwDKFIt7EoczG0wYfYnpGHyXXopj9zSMIhm9uBegyCilBOmxf
         GWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738608; x=1796343408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gye4YsbUN5yG8oY4A5kAtzWYZXrQDCSgln8D0vjm4yk=;
        b=0fHA3CFXdISIPFpD7gnhlIv5xEILhAfcUa9Zae1dPAtxrs0KMMI/3S6I/v1cHF75+p
         yf/euds5mmEbEKpmtm9rcbnvtuT5a+R/RlLT4xtEwfmznoWLA8PXazLUCy0U8xs39VlX
         mi7xm545vxJYK2eDbgm11NB8M/OvfBBPleObeHzgPhrbOo53jh1DuVz9+hsy7C2Dzh4o
         Wicy+7fe1ZVjFRQvqmtWmiesNM+c3hAmAiUrlq4n/yVZ9fzooTz9g3+tlTwGiZzUTcLg
         w9pC9rwnH4ZIjeBaI5UYz9qS8wUe7v3zAwjW1eEX6WvoqTmXJ4jug3JrAx81aj1QEh6Y
         4Oqg==
X-Forwarded-Encrypted: i=1; AL+hErHdZu85MOriKTpg+EX2Ysv6W4P3oTxv/IsqnOoqnrm720H9UtiTpt/r9cV776Hswn7ibAE8/To=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wvIiRMCyS/81Wwq14pHD0ipaE6S0on4/TiiQqwFWIDLCHPX3+
	SUCU9IA4uV9CR0VoN7hDvV/VI+RKRCBAIQFVOSagZuvfmcL/NLhRtnM=
X-Gm-Gg: AZFdTZc3nYu90+9+wMGNwS9eS5Db9P6OiqF8/sRjQtOsvvc/RkwcQtcRFGZKidIKXzZ
	yq+CdWWkxEp6WqfJJY4yzqWNm5zd94Om4mNXE16+F1V5D6SrFTOSIWFlKNuVs6j9u8eQ8ST39Dc
	+3Ykao9RvLUcCdStwfGzn7D/jGtsXHC9pNl08dKci6YIT8auJDNSHfA4l0Sue+dUYZqdZRbAebO
	/sQRMbNjadGznOmmWWE0gL0YCIsJdyq8+jM0b75rsJwvVqhVtLTbYfj7K1/Fxt/HwFW+lRe5dp+
	6mxLeMrGaQGvi+gRDZMlWce8nUsZNhHVeWOsv1YOZ8aeJYlaoL8MvxeOGl0GmDUeb0dT3L3byix
	2FnEKno0NEH9LdZuniK223dtEAKraGY4crPdCXLbhRhIYXJGsw9vOH3a9eZOnpjWDA2A/cAKosS
	HzvI1/13SGBIOdgRlQLHK08Y4K6be43K49LIHB5GVzvxk0xVTFRmsLSLZ3OXMZRPtQBgdf2V4Js
	hq3Xq5ER3Yp8tHYRnjeg7IfCIn50gb96QMBtwCsKmBQhm2GYG0L4A0yQCahpb4XRh8wHvXOFipV
	8Eopddst+YmODqhu
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr470420415e9.19.1795738607998;
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm356650865e9.3.2026.11.26.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:16:47 -0800 (PST)
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
Subject: [PATCH v2 nf 2/5] netfilter: nft_meta: pin file with get_file_active before reading f_cred
Date: Fri, 27 Nov 2026 00:16:34 +0000
Message-ID: <20261127001637.1026589-3-tristmd@gmail.com>
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

nft_meta_get_eval_skugid() reads sk->sk_socket->file->f_cred without
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
 net/netfilter/nft_meta.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
index 01cfbaa365250..abf0bbce9bfda 100644
--- a/net/netfilter/nft_meta.c
+++ b/net/netfilter/nft_meta.c
@@ -17,6 +17,7 @@
 #include <linux/random.h>
 #include <linux/smp.h>
 #include <linux/static_key.h>
+#include <linux/fs.h>
 #include <net/dst.h>
 #include <net/ip.h>
 #include <net/sock.h>
@@ -135,19 +136,17 @@ nft_meta_get_eval_skugid(enum nft_meta_keys key,
 			 const struct nft_pktinfo *pkt)
 {
 	const struct sock *sk = skb_to_full_sk(pkt->skb);
-	const struct socket *sock;
-	const struct file *file;
+	struct socket *sock;
+	struct file *file;
 
 	if (!sk || !sk_fullsock(sk) || !net_eq(nft_net(pkt), sock_net(sk)))
 		return false;
 
-	/* The sk pointer remains valid as long as the skb is. The sk_socket and
-	 * file pointer may become NULL if the socket is closed. Both structures
-	 * (including file->cred) are RCU freed which means they can be accessed
-	 * within a RCU read section.
-	 */
 	sock = READ_ONCE(sk->sk_socket);
-	file = sock ? READ_ONCE(sock->file) : NULL;
+	if (!sock)
+		return false;
+
+	file = get_file_active(&sock->file);
 	if (!file)
 		return false;
 
@@ -164,6 +163,7 @@ nft_meta_get_eval_skugid(enum nft_meta_keys key,
 		break;
 	}
 
+	fput(file);
 	return true;
 }
 
-- 
2.47.3

