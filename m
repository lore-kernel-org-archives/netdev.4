Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525645;
	b=Uo886aD1mUq3g5lqiu0pKrGGAYsIDzjGlfdcjs1whWyDFSVd9PzQ71yGLVcquxaongBT
	 n+qlti5O/WD2vw4xgwP9o0BsEJWEupfLKPC9YcDjNn0nkTgGLn4V5USLdmgryo4wWFKlC
	 uBcmWFA5N+jzhcjeWHeI3WtzS0/Q5wlc6hLFI9oeWY+Xe+uJn/AOj1v1sO8/TFQASVdQU
	 CTr0jMr4egBVyAK0GUuvl4lg2GgbGLbEXsjUqHH5y2LVPvjIqiuzhAkKnu3BYjMHSkVoP
	 syruURKJY9I1Eu+D9xhSZMaKN3gY1cECYGcc6JKJXs88Gsequf8xT5EVy/btTZdkUkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525645;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IRYpCfBdDG6Cmr83IE6+7sfFsL5aqFoYzM91s2U+Ui4=;
	b=ZpzaoyZW7GEyeEsmfaLuPexqMUiR/f1MB3sPSvahc21f9uyOae+aRSIS09lfY/tw9mLD
	 pH4UmHbVQmZj6V5XyLpP7TC+FsYrSZ2V35NRS23x2aEHhDBsN3SKnguZUgyWov6paAjwP
	 SOf5I8dWWGsBhmciF3w9yKWtURuQFy4gHvdYTRH+qtf7Mhn0G4bgAzt0IdXZX/TLgol2j
	 Co7xUGaWkBsPB5octr/576thE8GCCrvMepapLOQ6UbHy0it4VrAGaSi+hpjpylkMkHDPJ
	 LjuF0OtiwRjYyJU6nMBNH5+VIxbACyUIA7I8zvOe7Cg6+eki+GjN0Uq1bC2hMDjytaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iTJGjG3n;
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B7606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373B7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iTJGjG3n
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ibxHueNdSa+6jCrSJ3z2vsx/BayuZQYl+Vp2C26ROrY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795525643; v=1; x=1796130443;
 b=iTJGjG3nry4hnjW096EFE24uo5BhjLnR2EKZDCvRGidQFXv3lsy9/q399oqEgmVcerS2rmx0
 ltjYWGGyDHbYeQp/JHmMXV6CeQDM6H0R3bXGb23UFCcHBM6GIlexNosvUD1cXr9/bpIikEWgUxX
 VFuPMgwt1oIlQmjo03KkQk1g=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c346e1770fb1ab7;
	Tue, 24 Nov 2026 13:07:21 +0000
X-Mizu-Trace-ID: 9c346e1770fb1ab7
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net-next v1 1/6] tcp: avoid a stack canary in __tcp_select_window()
Date: Tue, 24 Nov 2026 22:06:26 +0900
Message-ID: <20261124130631.1886963-2-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
References: <20261124130631.1886963-1-xuanqiang.luo@linux.dev>
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

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

__tcp_select_window() passes the address of two locals to
mptcp_space(), but only for MPTCP subflows.

With CONFIG_STACKPROTECTOR_STRONG=y, this forces a stack canary in
__tcp_select_window() for all TCP sockets.

Return both values in a small structure instead.

While we are at it, do not compute tcp_space() and tcp_full_space()
for MPTCP subflows, their values were overwritten.

$ scripts/bloat-o-meter -t vmlinux.old vmlinux.new
add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-51 (-51)
Function                                     old     new   delta
mptcp_space                                   87      86      -1
tcp_connect                                 5892    5876     -16
__tcp_select_window                          706     672     -34
Total: Before=24068967, After=24068916, chg -0.00%

Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
 include/net/mptcp.h   | 13 +++++++++++--
 net/ipv4/tcp_output.c | 14 ++++++++++----
 net/mptcp/subflow.c   |  9 ++++++---
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/net/mptcp.h b/include/net/mptcp.h
index ad7005b574bb..95ebcfd5950d 100644
--- a/include/net/mptcp.h
+++ b/include/net/mptcp.h
@@ -126,6 +126,12 @@ struct mptcp_pm_ops {
 	void (*release)(struct mptcp_sock *msk);
 } ____cacheline_aligned_in_smp;
 
+/* Result of mptcp_space(). */
+struct mptcp_space_info {
+	int space;
+	int full_space;
+};
+
 #ifdef CONFIG_MPTCP
 void mptcp_init(void);
 
@@ -144,7 +150,7 @@ static inline bool rsk_drop_req(const struct request_sock *req)
 	return tcp_rsk(req)->is_mptcp && tcp_rsk(req)->drop_req;
 }
 
-void mptcp_space(const struct sock *ssk, int *space, int *full_space);
+struct mptcp_space_info mptcp_space(const struct sock *ssk);
 bool mptcp_syn_options(struct sock *sk, const struct sk_buff *skb,
 		       unsigned int *size, struct mptcp_out_options *opts);
 bool mptcp_synack_options(const struct request_sock *req, unsigned int *size,
@@ -291,7 +297,10 @@ static inline bool mptcp_skb_can_collapse(const struct sk_buff *to,
 	return true;
 }
 
-static inline void mptcp_space(const struct sock *ssk, int *s, int *fs) { }
+static inline struct mptcp_space_info mptcp_space(const struct sock *ssk)
+{
+	return (struct mptcp_space_info){ };
+}
 static inline void mptcp_seq_show(struct seq_file *seq) { }
 
 static inline int mptcp_subflow_init_cookie_req(struct request_sock *req,
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 08d0d4a639fe..c2022fc9ad52 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3391,12 +3391,18 @@ u32 __tcp_select_window(struct sock *sk)
 	 * fluctuations.  --SAW  1998/11/1
 	 */
 	int mss = icsk->icsk_ack.rcv_mss;
-	int free_space = tcp_space(sk);
-	int allowed_space = tcp_full_space(sk);
+	int free_space, allowed_space;
 	int full_space, window;
 
-	if (sk_is_mptcp(sk))
-		mptcp_space(sk, &free_space, &allowed_space);
+	if (sk_is_mptcp(sk)) {
+		struct mptcp_space_info info = mptcp_space(sk);
+
+		free_space = info.space;
+		allowed_space = info.full_space;
+	} else {
+		free_space = tcp_space(sk);
+		allowed_space = tcp_full_space(sk);
+	}
 
 	full_space = min_t(int, tp->window_clamp, allowed_space);
 
diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index 00677fb3efcd..d22ee068f599 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -1532,13 +1532,16 @@ bool mptcp_subflow_data_available(struct sock *sk)
  * as far as mptcp peer is concerned that data is still inflight.
  * DSS ACK is updated when skb is moved to the mptcp rx queue.
  */
-void mptcp_space(const struct sock *ssk, int *space, int *full_space)
+struct mptcp_space_info mptcp_space(const struct sock *ssk)
 {
 	const struct mptcp_subflow_context *subflow = mptcp_subflow_ctx(ssk);
 	const struct sock *sk = subflow->conn;
+	struct mptcp_space_info info;
 
-	*space = __mptcp_space(sk);
-	*full_space = mptcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf));
+	info.space = __mptcp_space(sk);
+	info.full_space = mptcp_win_from_space(sk, READ_ONCE(sk->sk_rcvbuf));
+
+	return info;
 }
 
 static void subflow_error_report(struct sock *ssk)
-- 
2.43.0

