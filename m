Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500976;
	b=Q8N3H4tKqvIW6izEj3oHKPctxMgQvBe9PoMOzo7AjU45hwf+vWBQHhmj+6xCntZ2SXcP
	 ly0C7QMT6qMRCeU+zwdwYHsU6ZPw6bUhCx3XgcNYcRXC9/mmbmxTGTBNkzlicbNx8DD0U
	 y0xlYz6eQgX+bWnQDmRweNJrYzYlOFTaIN513faAJxbxdi1h1h/uwSRrt348f4i5Ce9+H
	 XoiLZtIMu8X3JzIxZETRsqVUrpVdSOGax+SoJgf9m8jCa+u/5BiYcynH9L0SPe2mA/K9k
	 39w8z4QVC4kKEWzUd89eNYhkZqI3QHGnuS54mc8Iw1X7XMu4fpSmy6Ipu2ALO5R4Y5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500976;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bJG1Ph17o2sFqd0hCacoT7m8G7WDzIuzW3UzXnp5Ges=;
	b=Euh3DveKZc0SzqlZ+6riKbFgC1CVAF1wudJYlkgPO7Si2dvutoWGRuJ/6ywJs4HOZ6jA
	 4jOs2X25rgeXpHJyOkQpyPieaZ4ATUxUWxgMqKNNT+espAiWlaQnX5nEcMThqgomnPyaa
	 67s8boY24YTbpORrVoAy+U5EmXB9LeprMntVVF0Sb24fFFZ3UJVCG09ULS4JI7bVupUau
	 JttJYk0jD9FIH2y8ZpVi//9rXJjv/p9hvEp0RdjE6Td8OZ3lmHhLA3W0k1vaW1epawjJJ
	 +7mnxDXpoXL65FbdvGBWI3HDFXEuCxuWuvr3RHqVxXFb4EaCdYTxreTHtJS//p3A8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qu57ktkC;
	arc=none smtp.remote-ip=91.218.175.210
Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A039606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A039606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qu57ktkC
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SMHX9yHMBQBinyf989UO8I8j+ewwygMpJYQnpQd16VM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795500974; v=1; x=1796105774;
 b=qu57ktkC6JhQEqyjc7YD2/vC+MKeXEsM/fDhNP/vKmlByx4udH3qa46aIxhmPnpKxf2Yih6+
 peFvLjt2izbvjh48e/wKwaq8a/4clCK3jMemAuw2CW1mkKVhi2DDtcJ5PuDYOgDVWVfqZbAwC3F
 ZZ32HSxAkXv5rzgizgLQrnv8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fec14db3be421640;
	Tue, 24 Nov 2026 06:16:14 +0000
X-Mizu-Trace-ID: fec14db3be421640
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	sdf@fomichev.me
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
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
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: test rejected bpf_setsockopt() in inet_csk_clone hook
Date: Tue, 24 Nov 2026 14:15:36 +0800
Message-ID: <20261124061544.254586-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124061544.254586-1-jiayuan.chen@linux.dev>
References: <20261124061544.254586-1-jiayuan.chen@linux.dev>
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

Check in the lsm_cgroup/inet_csk_clone prog that SO_KEEPALIVE,
TCP_CONGESTION and IPV6_TCLASS are rejected with -EOPNOTSUPP.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/bpf/progs/lsm_cgroup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/lsm_cgroup.c b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
index 3bfa479104be..f4e3278d46d1 100644
--- a/tools/testing/selftests/bpf/progs/lsm_cgroup.c
+++ b/tools/testing/selftests/bpf/progs/lsm_cgroup.c
@@ -23,6 +23,10 @@ extern bool CONFIG_SECURITY_APPARMOR __kconfig __weak;
 #define EPERM 1
 #endif
 
+#ifndef EOPNOTSUPP
+#define EOPNOTSUPP 95
+#endif
+
 struct {
 	__uint(type, BPF_MAP_TYPE_CGROUP_STORAGE);
 	__type(key, __u64);
@@ -168,7 +172,9 @@ int BPF_PROG(socket_alloc, struct sock *sk, int family, gfp_t priority)
 SEC("lsm_cgroup/inet_csk_clone")
 int BPF_PROG(socket_clone, struct sock *newsk, const struct request_sock *req)
 {
+	char cc[] = "reno";
 	int prio = 234;
+	int one = 1;
 
 	if (!newsk)
 		return 1;
@@ -184,6 +190,17 @@ int BPF_PROG(socket_clone, struct sock *newsk, const struct request_sock *req)
 	if (prio != 234)
 		return 1;
 
+	/* The child is not set up yet, these are rejected. */
+	if (bpf_setsockopt(newsk, SOL_SOCKET, SO_KEEPALIVE, &one,
+			   sizeof(one)) != -EOPNOTSUPP)
+		return 1;
+	if (bpf_setsockopt(newsk, SOL_TCP, TCP_CONGESTION, cc,
+			   sizeof(cc)) != -EOPNOTSUPP)
+		return 1;
+	if (bpf_setsockopt(newsk, SOL_IPV6, IPV6_TCLASS, &one,
+			   sizeof(one)) != -EOPNOTSUPP)
+		return 1;
+
 	/* Can access cgroup local storage. */
 	if (!test_local_storage())
 		return 1;
-- 
2.43.0

