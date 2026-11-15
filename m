Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756260;
	b=RQZV2PMSmKtRe9ERNHrfHRRp+RDYa/gK9f/O6b097xGTIPG7XDiYn4LF5XNB8rwvx0qk
	 MyAc71RpxLchMmBQ+LR2aYnlBh1wvPvWf+CRO+vtXYKBHB+LekupO4YX5Dx914m3iXkRe
	 /0xpwMeYjrJshkRIY1s2CMJ96QQf9YInuaOkyKDOOVXXxMw47fxti1i3KlyR/x7QqmhjX
	 gzpnOEVB3YuNLfYbVEZpSJjyw3B2fp353MdJGFO5/84sTRm1xsu0H1zhvXPtcSPJ+GoYN
	 Ac46YzVlUCxMP/1FwNZRqaJkmghQiqz7KiXC6JAVNH4naBdrRou1j8XJ4tvJ1C2B03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RsdeMcHfOtRvnpyG5YaLPUdVfJcBoSbUaq4yQfndVIw=;
	b=qgbEydlCvn70q77GV7M2sxSiHJpoSmSCjAZ8aBjLlvgKxY6glbh8eCnEjPD9uV2s02/3
	 T72KiUJHcoNHtaX4EUsSG85wCw9cVsZjP7WjyMWrhpVW/27a8BXhsFbNVAv2XvXNrMxs8
	 /4MMjIg6qVUWHHzNXaLClcOOsyenwJz7z6p9AawLsRX727xk7R7BvE/Gxwk+dvLxtzLT/
	 UPT5QlX67RctFf3evC+gR+4BXtKU56sX4tNfjdP6MDm4q+ewF/Guwx3LvJfBnthpSdAki
	 J0VZIH/OkF23GXmScPsT6gP0iVBeQgP1pm6fAuU86EcW+cKrGxO4jaQFLTcsa4NZeIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvqa+OMH;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66832606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66832606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvqa+OMH
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so615112a91.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794756260; x=1795361060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsdeMcHfOtRvnpyG5YaLPUdVfJcBoSbUaq4yQfndVIw=;
        b=zvqa+OMHr0nV49/v00q/9VhHcjcV3dmBOQXteWf01yIVlwbfNUDhoEcwIeizNkEoCs
         3drPy2xPOS9nMDjmBAZ0kHOMdFCG/qWJJDsweuOkhHK9GJFrZZ/PJ2wvUaLaE6mqXbol
         BtUdM+78xkq7x1M3DjvdAsvsW5wUaiTvGBr29zQ2LXkuSITd7qdbd7bGm+sfODp938ly
         QdUO9kLTac71RMn64Z6dWmYpBEbwD6WUhr9aHQubJ6Ug7rdGp3yRDtqO4h5UExL2h0ZI
         dgPlss6bwUGqZqnQ8T+1khV4v7/vz+zXqvOP1lS/DhMfSIR/zxx/xqys7viWet1+SCJa
         UY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756260; x=1795361060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsdeMcHfOtRvnpyG5YaLPUdVfJcBoSbUaq4yQfndVIw=;
        b=F9utUhBwzmujQp5k3j1RF1JkS7j5vNab+vSE5FGWa8ebxIVljC5vY48KT8l6mOizZ8
         l/bEb5q+rrSyaeBZ9Y4yaxC9qu86NBOiBs6F/Fd6o/mSKEEj1kZBEVmLgkCW+pPiyM2C
         V5hzCOk3TbJDRwePY1i27Sd7Jdm3ldLCg/42auSwtHMfA/BnweSjNvMguX0TfVFROTFe
         7EM4OAzlhs5me8XRpD7rIiCmIWNK3NKw57L7XID9KX+xllHoQd2iIQ6fggcRZ2EX36j/
         gXtxeURxhai0Mnq6yxchEOGZ3YcyOOvdjBtExvn9UQRSZaDwaE7q5pzSeWFKysYx6hAy
         mYcA==
X-Gm-Message-State: APuU4Z9FlbIFiD2OvGA0uzjsG6+AwI+0C9LXK4jN2wtCWzO/VdsCQDZJ
	t0GJ+SNRkogEQSBMJBgCDTCRCdSwRq+Xryq6eK0mvH0Ffw4ULPcP6piOimZ6dHciYMUWuw==
X-Gm-Gg: AYBFou35kVGqwoFyBuxfFE+vibocX1sz/nF6XnAZWtA6dsuS+LJZoN033JdLjBg9/W/
	MlOSEqlSE4JMYKTZV/VBL3qGpeCuuOcRlLfXj5zq1zWsQnpUDx7dih3tFkWzJ0hynSJxnyM3Ueu
	eXg+/CfBsfI1v3zA26IiYO+AgXgzkF/oCjYCQvUBK1pvBPPzMGOFuAySOG7gggdjynrmXme620Z
	lwne6CisXVk6MBZdtOkun5N98npL5wwPKClJe2YAb1eGSJ9pKbBvS8bG3RnP4560tYGgMhvY509
	EGRiCp6Ui7gZYFF5H3jjjYgqkAtcNjeRYA4trzHDDMF9wCic3SYjbFHRKSGT1GRI66LyVm/4RHu
	t5CU9bBaDot10FItUBcr/zjjzWqYsDHLPfaIsSMJcL8BwkahGF1AhnJadmw3OT078mAs3fUnOhs
	QAUEEA2VLQzQo6hjBrc1xT/A9jIb0T9WwT8Lz1nJSPH2ref/nF2ZWnkfM8kYueokJGFTEU94/Ln
	zZkSBXz0nm4s0eboy1qsbSr1AakkuK5RfMFR4MKFg44uUhR82VEUTboZAfDgojUjYZlTMR0DB9Q
	sCATtoC9ttfz3XS0GL6VuyCKaO33eBfzSZBR9WC5ffrlhXY=
X-Received: by 2002:a17:90b:4b0a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b1b09fa36bmr7316575a91.19.1794756259730;
        Sun, 15 Nov 2026 07:24:19 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm13173904a91.14.2026.11.15.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:24:19 -0800 (PST)
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
	Linux kernel audit <audit@example.invalid>
Subject: [PATCH v1] net: sock_reuseport: check program type on the migration path
Date: Sun, 15 Nov 2026 23:24:08 +0800
Message-ID: <20261115152408.48205-1-shlomojune6@gmail.com>
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

From: Linux kernel audit <audit@example.invalid>

A BPF_PROG_TYPE_SOCKET_FILTER program can be loaded with
expected_attach_type set to BPF_SK_REUSEPORT_SELECT_OR_MIGRATE and
attached to a SO_REUSEPORT TCP group; both steps are allowed without
CAP_BPF.  Closing a listener that still has queued children then runs
that socket filter with a struct sk_reuseport_kern as its context,
while the program was verified against struct sk_buff.  It reads and
writes past the 56-byte object on the stack, which KASAN reports as a
stack-out-of-bounds in ___bpf_prog_run().

The cause is that reuseport_migrate_sock() decides from
prog->expected_attach_type alone.  That field is supplied by user
space and does not identify the program type, and
bpf_prog_load_check_attach() does not reject the value for
SOCKET_FILTER programs.

Fix this by requiring BPF_PROG_TYPE_SK_REUSEPORT before running the
program, and use the same check in reuseport_stop_listen_sock().
Socket filters can still be attached and used as selectors; the
selection path is unchanged.

Fixes: d5e4ddaeb6ab ("bpf: Support socket migration by eBPF.")
Signed-off-by: Linux kernel audit <audit@example.invalid>
---
 net/core/sock_reuseport.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

--- a/net/core/sock_reuseport.c
+++ b/net/core/sock_reuseport.c
@@ -460,6 +460,18 @@
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
@@ -474,7 +486,7 @@
 						 lockdep_is_held(&reuseport_lock));
 
 		if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_migrate_req) ||
-		    (prog && prog->expected_attach_type == BPF_SK_REUSEPORT_SELECT_OR_MIGRATE)) {
+		    reuseport_is_migration_prog(prog)) {
 			/* Migration capable, move sk from the listening section
 			 * to the closed section.
 			 */
@@ -644,7 +656,7 @@
 
 	hash = migrating_sk->sk_hash;
 	prog = rcu_dereference(reuse->prog);
-	if (!prog || prog->expected_attach_type != BPF_SK_REUSEPORT_SELECT_OR_MIGRATE) {
+	if (!reuseport_is_migration_prog(prog)) {
 		if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_migrate_req))
 			goto select_by_hash;
 		goto failure;
