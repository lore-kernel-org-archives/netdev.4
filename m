Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976197;
	b=1cQ/pTqKNQzsHX/PCi8vNlInUOZjIaXq0emZjNu1mb7YVuVoFg4geolD49MIqu/89l7b
	 7xHgJKlalme5/tLn3lLSpVdI1BXjgbZXUN6ij1Hsq0vtHIzq8Bd743gErnaorCF35D/3Z
	 FbnQRE+oNE7Xyhb/BqScsDcH95qiEFvWIqxlfCGJTXK6iMtu9xyMzro00TXkf1/3C135i
	 Uz6VjGXqi8UuXieluKTvtrKkl7RDS1WoQYf/zgpWoBPA10xvDj7cko/S10RQ5gpUtqatr
	 L8wNsuWj84XTsNVSMjJ3XNvADmOpu8qAKJ8vT9OafVdFbIe3PrexmCa6gdKtUX+PdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
	b=mkoMo34vGCbV7OieV4siEXX+/wG3nuaSCWVmpIij0dV5G9aksc3BB1SrsRltBszstMYY
	 /2Z6sakX4yQ2+B10T3FZ0PryPa6CZ67alwhmFg3DmqYme13U+j1zZvwc76Tg1h0twOBSp
	 FUqEeqhCRUGYOIZl7Ru8Ykd2HJmvcml93Bv7jBBMcKh8kYiYG0Oi1P7AiTBJy5M8893ED
	 M6gJrQqAheBhda3JeiZ0kgxO15nXvfkA3R1gd/NOcApe6v3TJZM9A0xNMVDnwqFa2mBmy
	 kOJvJtyvRh4QEh1hu/b/CYMZhb6DobwNtzY3LLVC8eb6gMVVaccwNRC3UY1wnhXzQzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX6CghMX;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2612606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2612606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX6CghMX
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so313033eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794976196; x=1795580996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
        b=KX6CghMXtqwmXH+k2x/YLE7ck2w8PI3LkWfSrobtdaskFNDxfHjRjdQHJwSlA2lp3v
         M2Lma+VM5Mvr2z4dHyaAPidQnBDGfDc0BzaIz57a/eAz57BrEnOY4Cw1kjjsJdJk6cBk
         i4DjvGrvP+HoXxsx9ANrheHnFYwYxTnAWJPoXSRzVQCGBx2OaY/aLQP7+3z8xscMCYa5
         o0E/xqMWa3vPnUq5p8PMF7vAkaa8FVy8z7qKC0Ur5llGkwwywXPNqZuYg1lXYqyEj9mI
         H1rWSWz5uaQoszbm2uVYFp/yzLrfBwZ+bTbROX9Xe07+AGtBOS78t3g/KhHB1OL8AsiO
         xpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976196; x=1795580996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ9gCj2jGGmLVFKvuakf/3ErIiC4ZxE44mtjMvsbMAw=;
        b=hYwFCUCPHOC+nrzVHz9ZmYpRJP/7daNhWYCeLOH8Z6c1/3iROsaby6BznnmQIcw4In
         XQ1fDzr4C+A5frKzQqYnBQFITkKIDjL3ekV2dsBe5syD7B0LQT13t6i/8Njg8WF/uyHt
         dgR/n9OSG60ro1XpHEQXnb4eJMqb7/4bs1pGGfMnvVsT90Eec/zzrpf7Hke45HlDhBqI
         fkMmsmNHDA3Xnq6BROitEWk37f2RwpiYRzaxTlOtLRH36BHn/GVFhNxoXHZ+wIOqCIfL
         DTOi51moIfR/ilbct7QeCyvkVARKx/DhZ2iKMcsOwqbPNh0t9WrBCGGqJrOh19jxIOYl
         TREw==
X-Forwarded-Encrypted: i=1; AL+hErH6l19FmLpIb0X/mW05K4PnE+e2m5uGHQmhmdQg1K3NMP1YD35m98jqEG9a2YKKcBM+tORdZS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oI3fS0XHW0lFOabUQyuTZz2yN73IbekwQKMeZWNvfbCGeVqQB
	T2ROQ+ic0Bmhyz33GV1ERfccat3ubW3SjGw80Du9LTMr2YeOUoZ+Tx2m
X-Gm-Gg: AZFdTZc/xR1nffVXgitIjsDzo0xPH7A+IsxpJ9yhDu2JsL1tlgSIGu9i+RXOEE016Yk
	LykxRcUsUeKh7orLQS9aRgy4a2e+hz5EedjERdEGTNQXt14nMBtly4rI8rJYTjiL32y0fTxpyCA
	TG+Zujjo9EOYEyRWzs+DC3Po3g/EAsiohKdUaktXYix2yL2Hue/VIMU4X2oSRWCedIzouywjRJ5
	PvBBPqVA/2fa5HotWuK4w5m0o7Qk3HRcqj8163M0kIQW08h7Q6Vep8Cr2ZmW2K87Db0i+FmvHXG
	eQHYmrZ0b6+6dxgvVzlxQigAwfATw7fswuvDsJXgnMqk9zU7EEIP1Fu31nytF82vkBAt5DmUpw/
	DwMNeKEHv836xx4wvsuRGfVp6D72CY7dfAR1JAverXMQtoepVUjY7AuXm9mq1suGk/OpCGUTW7n
	rA8EF8yj9t9VoJzYrnpAaxMjH+JAeCWd4/70qLuf1XcnfE/t8xJfuCTgBJL5XpypHKtTk300++a
	B2rwiXP0CJL7p3IGnATNlLSNMIyfFlcsJNk0uJkyRtC+SVzM2Us9pj0aKd9DlYJ1RMZPe1jZJSg
	yZ3tSfwopWK6TBeDqvC8EGlZWf+Sh1ky8EXbU2TRAp8+j8bpF1K2Mg8qash/CB5iCFLc1BO8v1j
	Z/2RB9SQ+B6uDlvsWLp96v76HQ0gDG6Syg3ZBjaAVzu08HVRIG33Zonds3EjrQt7N3EIBw5LjBi
	mE46OdAThP+d95yHthft3mAIQ4qTkJulvLYEP6sEegTDe+oK7cmUK3R6OIMelChw+TmdcdmQ7GX
	6eewQte/N0p13fDQOkuVfBMBzv5
X-Received: by 2002:a05:7301:1823:b0:379:3c04:2cdd with SMTP id 5a478bee46e88-3828181119cmr1441606eec.31.1794976195799;
        Tue, 17 Nov 2026 20:29:55 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm5273447eec.7.2026.11.17.20.29.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 20:29:55 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf] netfilter: ctnetlink: apply port filters to SCTP and GRE entries
Date: Wed, 18 Nov 2026 09:59:50 +0530
Message-ID: <20261118042950.83129-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ctnetlink_filter_match_tuple() only compares CTA_PROTO_SRC_PORT and
CTA_PROTO_DST_PORT for TCP and UDP. SCTP and GRE also parse these
attributes into the filter tuple (both use nf_ct_port_nlattr_to_tuple()),
so a filter such as "protonum SCTP, src port X" is accepted, but the
port part is then ignored and every SCTP entry matches.

CTA_FILTER is also honoured by IPCTNL_MSG_CT_DELETE
(ctnetlink_flush_conntrack()), so a filtered flush that asks for one
SCTP port deletes all SCTP conntrack entries in the netns, and a
filtered dump returns all of them. The same applies to GRE keys.

The port and the GRE key share the same offset in
nf_conntrack_man_proto and in the dst union, so the existing
comparison works for both.

Found by reading the code with LLM assistance. Tested on x86_64 under
QEMU: with three SCTP and three GRE entries, a delete filtered on one
source port (or GRE key) removed all three entries of that protocol
before this change and only the matching one with it. Filtered dumps
show the same difference.

Fixes: cb8aa9a3affb ("netfilter: ctnetlink: add kernel side filtering for dump")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Based on nf.git main 734bef548a96. Tested with a small raw ctnetlink
program in a busybox initramfs under QEMU (x86_64, TCG). It adds three
SCTP, three GRE and three TCP entries, then sends dumps and
IPCTNL_MSG_CT_DELETE requests with CTA_FILTER set to protonum plus
source port. TCP behaves the same before and after. Also built for
i386; W=1 shows no warnings for nf_conntrack_netlink.c before or after.

 net/netfilter/nf_conntrack_netlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 1f8d94a05..5e8e0b93b 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -1127,6 +1127,8 @@ static int ctnetlink_filter_match_tuple(struct nf_conntrack_tuple *filter_tuple,
 	switch (ct_tuple->dst.protonum) {
 	case IPPROTO_TCP:
 	case IPPROTO_UDP:
+	case IPPROTO_SCTP:
+	case IPPROTO_GRE:
 		if ((flags & CTA_FILTER_FLAG(CTA_PROTO_SRC_PORT)) &&
 		    filter_tuple->src.u.tcp.port != ct_tuple->src.u.tcp.port)
 			return 0;
-- 
2.43.0

