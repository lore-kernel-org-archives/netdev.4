Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016154;
	b=qmNU41ftpi6o7pEClQYBH8I6Lm7LdJ5sg3+AeVbGsqRDXmROEP1wXBIG59D9zaZObTZL
	 Sk3dRrkFYd5NQ7dtEsTVXiVRYSgvvWU4ZGaen/1Mfh+/OQ5MBsbh1D/nWt8PFh8Fa0cDn
	 s1HmV/cD0rf7+LrWpsJup+ezC3sGrOTzPKdD5SAkQxgvfNV+q7HeUobzLcWfrtfkPBSco
	 TvPQhvNCtWiznUMJTTQpK7Ecxy1R1/6WK1Ap848fYc7RMOqiUHmUMA1ewyFKUe/cPw0qn
	 fiuGNgNFQEClpN2VxCbKG3WkSi4RkPUcGH+cFKbPlLx4kdRiqqzxgNrNfTJAQVOwXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3Qmc9lNd7iPlnbZyEjNTU1GhBxli118PZ9egywv3GAI=;
	b=eMYihDrSlaHGcs4EMYytQQetdSKLewW9/em0EhDwenCnhWdH70gCcumADj4xBwkERBmI
	 aYgjnuKikl1OlKEmj0bEiE0TkVdSDNlWCsg6dixz2+QYmnU99BG7iZQwtF3f11+0V+kTP
	 M3634Z56qOTBS8rWeuyv6HoyDslSt+jP4ytaNK961kfHtTte32KKa2PyQBTougY1VoP3Z
	 VhX0WXaGcxH/EQ8HHgl6rm70/GKA3C5dRFIOm538WuI9jhSYnHDtBMmaQuduivfZPS8zi
	 Cv83UO+5NvSYZ1Wm+vCBe0Iuor5PZXS/QX9/IN4QME4JdwhZ1J4vVgANGzNRY5XzO5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP0QupT4;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57060A2603
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB57060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP0QupT4
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3bbd46625so300087a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016153; x=1795620953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Qmc9lNd7iPlnbZyEjNTU1GhBxli118PZ9egywv3GAI=;
        b=yP0QupT4N4LRNps0kf45U5ceMoPgEFIHrfAFIu7l4xEwo7gzDxBRz6j8xgTDi+Z1xE
         UjeD87JhTWVaVo1jlCVyg6DzWgKb4HLsk1Hn5IRxv14EElD8WlMPu+0atQIWlnsRxAVf
         yxDJ4SONkjlwP+gW0hCK9tWtsDh2ntiXBSr5sottqEheRBNqpjgrPqlvqnu7MpURWfEZ
         Nm0EPeI2628kd7lwxk1W847ia/xVHg3+FeFj+AlNUPuRdwOVozlyVh5d0g9E7qz0TZSQ
         bjKXkWYCOUVTSj24IP5tHeBA7Z33kJoXzeBPphlVPjK1QRQNeyRnYs4BsbEYuthzATT+
         a98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016153; x=1795620953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Qmc9lNd7iPlnbZyEjNTU1GhBxli118PZ9egywv3GAI=;
        b=v7exzyFr6u+TetiFRNVDRjMQD03kVUQ+VRzmVS58W+pkHipBEGVE1Jix61QMauzwuJ
         CtuGUYgXg5Z3cDHT3o208yPLEkYCfCftY0qdGSWwvxDVpq1go5loY8OYlO12IqirW2vZ
         lQRkTBNM6Fp1MTlr1o8HRJzMm4cvzifws5edhIKM23t8ZutqaNjeI4pDpyEzqaXiJP9H
         Kjzzy70bHhxRMAhsUn26md8i+Zp+Lb1tiUoASS4+uttcI2f7LeiJCRLYa5emgYCFSYZ0
         xWQ0pBV0WEGUXNchMBewzz3rm43RHEx/LD+oEwSMbYTLfT7Kcghpd9vods5/SPb82IFC
         ik6g==
X-Gm-Message-State: APuU4Z8liLigrEcrl2bbXGdbpaMWgqPBQMU8fGNIKff6JhG1VRAZpJXQ
	Y6FSHIV8M4T/EC1CaFv+PrZGSJXEQUgZ0UvmqwAfQCk7YP/NelsfwGnz+s90be/dQi38eA==
X-Gm-Gg: AZFdTZdivDYUVwNMcigpRAjRr4hlWzmqPqTb3un97/muZaRlgzqL6fmExK+1QU4kpIu
	QcJzk7SsSI+/jc+0E+a133KD68J58O9uTvEQcwiB07oVBBPO/AioB6/LtqUZKJc16+OV3RS5D7R
	lAHMfcch/gSQHCI+GMHst2pS1huxDlbXZh4FwZCy4llldRRbwkk9Xen0NXILijT1thymjcaSaiB
	i+q6cdNvQNCp33ooWsjthZ63kx2VIvjz7pWES24D1exp0BBhpSNIK1Fee2nWURhuce7mqdo0qyK
	ObH1M3KhJ6u58NRbDiRidWgMROujnGKNni+y5CSL4jQSt8uDvs6FGvBjgMK95fXmEgLlsDTBE71
	u7Fe7YQ9K6++2YQ86iXYOFuzNF9ua5egrgRp4RQEKIc23pkeKlx/DR8PVIWmP5N7WJL3NDd7qGn
	Rzgx9ExIg6NYSGT33xwS1GVQQuXV077GQvol3efwzWAotvPkKFzhKNB96uvi3LKY4deVot1zwDG
	GzI4MCboE6bSC3XN81ZtdYlIooL6cQKe/K1oOt6E/ZaVwKgM/IzJLd8r882kQ2I0MPRPiNsHPDE
	BTa9T+FYxRXvG/CBGpK4VNc11MDPn6BVlhKA1HcOCwKNUmA=
X-Received: by 2002:a17:90b:4f8d:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b3d064130amr3334575a91.5.1795016152908;
        Wed, 18 Nov 2026 07:35:52 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214cd8sm15952755ad.44.2026.11.18.07.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:35:52 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org,
	edumazet@kernel.org,
	kuniyu@google.com,
	pabeni@redhat.com,
	willemb@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	horms@kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2] net: sock_reuseport: check program type on the migration path
Date: Wed, 18 Nov 2026 23:35:41 +0800
Message-ID: <20261118153541.172499-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A BPF_PROG_TYPE_SOCKET_FILTER program can be loaded with
expected_attach_type set to BPF_SK_REUSEPORT_SELECT_OR_MIGRATE and
attached to a SO_REUSEPORT TCP group.  Closing a listener that still
has queued children then runs it with a struct sk_reuseport_kern
context even though it was verified against struct sk_buff, which
KASAN reports as a stack-out-of-bounds in ___bpf_prog_run().
Reaching this without CAP_BPF requires
kernel.unprivileged_bpf_disabled=0; with
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y, the Kconfig default, the sysctl
starts at 2.

reuseport_migrate_sock() decides from prog->expected_attach_type
alone, a field user space sets that does not identify the program
type.  Require BPF_PROG_TYPE_SK_REUSEPORT there and in
reuseport_stop_listen_sock(); socket filters still work as
selectors, so the selection path is unchanged.

Fixes: d5e4ddaeb6ab ("bpf: Support socket migration by eBPF.")
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
Changes in v2:
- Fix the author identity in From: and Signed-off-by:.
- Mention the kernel.unprivileged_bpf_disabled dependency.

v1: https://lore.kernel.org/all/20261115152408.48205-1-shlomojune6@gmail.com/

 net/core/sock_reuseport.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
index fccbdd0430b059..9ab76697a794fc 100644
--- a/net/core/sock_reuseport.c
+++ b/net/core/sock_reuseport.c
@@ -460,6 +460,18 @@ void reuseport_detach_sock(struct sock *sk)
 }
 EXPORT_SYMBOL(reuseport_detach_sock);
 
+/*
+ * Only a BPF_PROG_TYPE_SK_REUSEPORT program is verified against
+ * struct sk_reuseport_kern, which is the context bpf_run_sk_reuseport()
+ * passes to it.  expected_attach_type is set by user space and does not
+ * identify the program type.
+ */
+static bool reuseport_is_migration_prog(const struct bpf_prog *prog)
+{
+	return prog && prog->type == BPF_PROG_TYPE_SK_REUSEPORT &&
+	       prog->expected_attach_type == BPF_SK_REUSEPORT_SELECT_OR_MIGRATE;
+}
+
 void reuseport_stop_listen_sock(struct sock *sk)
 {
 	if (sk->sk_protocol == IPPROTO_TCP) {
@@ -474,7 +486,7 @@ void reuseport_stop_listen_sock(struct sock *sk)
 						 lockdep_is_held(&reuseport_lock));
 
 		if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_migrate_req) ||
-		    (prog && prog->expected_attach_type == BPF_SK_REUSEPORT_SELECT_OR_MIGRATE)) {
+		    reuseport_is_migration_prog(prog)) {
 			/* Migration capable, move sk from the listening section
 			 * to the closed section.
 			 */
@@ -644,7 +656,7 @@ struct sock *reuseport_migrate_sock(struct sock *sk,
 
 	hash = migrating_sk->sk_hash;
 	prog = rcu_dereference(reuse->prog);
-	if (!prog || prog->expected_attach_type != BPF_SK_REUSEPORT_SELECT_OR_MIGRATE) {
+	if (!reuseport_is_migration_prog(prog)) {
 		if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_migrate_req))
 			goto select_by_hash;
 		goto failure;
-- 
2.43.0
