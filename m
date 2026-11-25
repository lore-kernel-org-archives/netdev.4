Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590237;
	b=1cv4irYgp3dMHRshr5o2FF9P2tGw0eWSlloJoEQus+YPyDkNh6t3hPWeQj9au9+3xAAX
	 FGN+owR1sX3SE0w9AZTqiWjiw6P7XVN64qAAfj3IrqeKJ7eafodGuqAWwUyTCa4LqTXIS
	 nGVsFEqkUoordRVNiKN4R8ed1vzVCYhWqclJQv4oxJRF681UA0UA1ARbIQz0lsD01chxi
	 bAqLzeqLugbiKjpG6yTXUTOF6dQ0/3ts8+2bL3K0nrn63v2LW05praR41P9CsCRi6+yPh
	 oObmx9qmn2okC+iKRKgalN9ElCAe1qXt8vT8KYFrOZJjr9RUgYk5Oau2wYz2sQzaRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590237;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bJG1Ph17o2sFqd0hCacoT7m8G7WDzIuzW3UzXnp5Ges=;
	b=PUFHymDVFQTqGnDa0814BkRJiZSt/L6IsIe8Rq0WRYhFwhjN35hadjXANz/M0vUlhr0A
	 1cF6L3GRBgWquNmS9C6B/QslMDJLPOhs5PK8nx28sGnk05+r0xMXvtrlONOb/SBay+Ydz
	 qAROLHQKUyMIfXjWs5qFf38Dhbx6fIYm4rihm6PCHhK352N5ur3dQQ2RWaBCKNwvrLVBA
	 EPV1CnAUhJUWyoOzxuLYvtT4qNJpppjK79D7gwYs+soajqWt4b86OTVc2dtAWiZZwbPN+
	 wOQWBHlXOY2Jv/A6pQj0Ttbw9ZMsLXAmsdhiVYkc77MJVv54JNHdn5d3FFZab+qkuxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BitONl+o;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E5606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BitONl+o
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SMHX9yHMBQBinyf989UO8I8j+ewwygMpJYQnpQd16VM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795590234; v=1; x=1796195034;
 b=BitONl+oNCjuV616C3aZHFMO2Y+x2Yo5QBwv+SX5B0N6MU5R5YqKjWvMEG75rvrlVjyRumR/
 DbUK/3kdv6/Y0U4VRfU4samkhZMI8a7OjJNOOKfGQOs3pvH1tboX9DpOypunQIXLYlri+Ut2FOV
 djqKZaixQEaF99Dp9YzYz4vg=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d366555245f6511;
	Wed, 25 Nov 2026 07:03:54 +0000
X-Mizu-Trace-ID: 0d366555245f6511
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net
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
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2 2/2] selftests/bpf: test rejected bpf_setsockopt() in inet_csk_clone hook
Date: Wed, 25 Nov 2026 15:03:22 +0800
Message-ID: <20261125070330.16625-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125070330.16625-1-jiayuan.chen@linux.dev>
References: <20261125070330.16625-1-jiayuan.chen@linux.dev>
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

