Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423393;
	b=o8zydqLS8mIzCIifEUA0jcYJ30vfzIzO0mUFQfmJSstqgY/AmnP7RpghtJmXdN2ujNGx
	 8QFgi/nfwUdWufCd5+ZY2hQnRXDTJ5l5TmEBLzZ3GCWpiQPC9QvQzv3J7TTf5zWdVcnyl
	 B+Zq2oxwdT0jZTEmvWU9gE+NtsdKldvxdRgYZJ9Vq0InbMdDme2qjmeansTU/2zvHBm89
	 u7AA8sbOJjO1tfReKzk1RiiZgQFDleDyZiTjm3VguxMt5WQHM59vpMO/s3QQPmKTTpxi3
	 Yn90Cx30Vgk5VJdnjANzYD0s7KK3oD6iKiFoYplVNnuQLGESQ++9KpEmR5i3sAHzyAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WsMDVDRcPOdr0yU45+bId8Zq42zni9YwKMp1FwF5jDA=;
	b=EPC4QYkLdeNQiBaEGTtgsanYjwL5FMEAshc+hKAXPQzA3pEmwlK14Zw/XGYQACLhm+p4
	 IZS99QmkKXROoPuxUi8YB+p/X4RyuGd6Kspt+sqAVlatUwE4hQHDtyDUB0hm2ACg09+r7
	 gHDcWRkci7GlY6c9nlWbpJEGWtG/y60k1GlCKLlXaTG+5BIOJIcDec0TUs2tivodvob19
	 jDv3uAzCAiQ2VtQXCOt55/zFqogZp8y8CGGjEu1tCXI5sy7PZwuomnmf/A7z95gi0C8TM
	 hbe/ZadLJ0Mhd66zfqVNXa5AmjQd9e+pPz+cdN9ZVHJz7JKd4PPen4hPda9NCpQSDzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=jvjl7UuD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C253606A338
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C253606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=jvjl7UuD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso36027135e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795423392; x=1796028192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsMDVDRcPOdr0yU45+bId8Zq42zni9YwKMp1FwF5jDA=;
        b=jvjl7UuDeylAi/aqGSsDGsKLMOdDb2OhE6HDHqm47lRoNW0rpGHBwOMnOc+b+ed2Np
         nyFIEIHasMr990mID+IBBY5NUr8cOfYQ8gRICFo8rsjeBoFC88qh1er7rwltZO9KkHr1
         BO4POBGI0x9etEmADs8E64wav/Wa7gK406jOeKYnuUvwjAf6eHbYNoIQR6utFHe1793+
         vrs2U7IvO7NpuC/AtJc6Cr0RLxARXHP1ROjbGtDFsl3PKWL8In7oSoyqbirPchpm0BYC
         ILA6tvDEfKt8kvUMay5hJBy6p8la4632ctx/XhdjGbXquRZKPbKeWgFS2eRzlKfjVcZ7
         oXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423392; x=1796028192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WsMDVDRcPOdr0yU45+bId8Zq42zni9YwKMp1FwF5jDA=;
        b=CBMuanNx5m5QywnZ8U8WFFPrn/A6B1MDDShJJAlGLsKpFXhnPP7GUtgPaVWxlx7Wiy
         1n5uLKjrZU6LHQ3skbOqpHI11/FA/Bz/ZXORdlKPhL1A1oy/WwX9dR14AoP2C797Elv3
         YW7/eu+L6pPtHxhU7fGAaHGVjuWGbiifAlHrqUdOw3NvKjyZlZppCQ+RC3y4AaQiMcuM
         Fet8E+4YdKrBXtuYH4MR8w5uWUFOAkbzdiC+8fzh/B+U3FnV6Tn0eg7SP2/npEuHYXx5
         Jzu1jKYhKJYAeTA8RHg7qdJkOBB7+4anflRhqSbrwmgb51eGYxFA8p0cbFEKeJfZAgT2
         3UDA==
X-Forwarded-Encrypted: i=1; AL+hErE5U68grdJb+G6mxfLpohFOpTJDC6krWHD2V/9wc2pt++x+kAfCXb1V+CFVYC5vNFRC6d4avK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FhPiwWncsHcycoJxGG8DtqOcahyidPRO3x/u7+tsxW115zksz
	8ZjWXdOcX3hXqbdDbeMrg0iyonq8kZlB/rwbFupzqkJxLB5TKp6ScH5ZX7EqwrkZmAU=
X-Gm-Gg: AZFdTZdo5zSdo8B+G6NMJk4Ufyrq7lMfViRFP+XIOA2GQcf0UVsRHd79OlXRm2Xj3zQ
	0CTws8Gzctg14knsQx2fF0hCSmSKrk33nNWDPtc/n1jD84HyJZLFKqNpT40e9VyUIBBmGv9vSa0
	NsZm3kT4tP8xo2XY23Heg9rwMMAa5q+eSulWtxo/hMY7M4gGi4vFglX5xjmvmqGCNsP4l6Qk9uy
	TIEmyLD7sulIfJ7rMv921F0wf/8oXyh48C6ZqwUMrZTX/x4/HW6IvvMPYhfmD/X7oaLULqMXnlD
	mJ8r4yuBX3LCT0UD9rQl4jssawmwqnhpiZG1yZ44P+o4bYpnQszoT/kSEz2r8vfWWaCeOP333/u
	acc3tnnKJ/kd8+3xj74uqlZxzqVOsJb4tcHSIJQeXuFO23Ro8ojzt+JJHYFVM8Aev9ik/H+v9m8
	n0CzzLYSapB2EyKEx3tq4THmYzwD6GtFhOzEw/xHnU9KLnH6f0XSrFOuyE7BZGt7T/H+zWmK33Q
	h4oZ244h3lVZ7k8ExcV+PxuMiCA5WFsciQbeViiKQzCu5JvDYtX6+RYRKwAB/7/koHX64fZ0QVG
	vu2Jzllybe9s2FuxmQK7mWIxu3sZ95KqGjK0SuYmlY4SkAjBvu5sI98DwGjam8Af+GdJzRbs
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr236936835e9.19.1795423391490;
        Mon, 23 Nov 2026 00:43:11 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb88442693sm286713925e9.1.2026.11.23.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:43:11 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Martin KaFai Lau <kafai@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: test assigning a TCP listener to a UDP datagram
Date: Mon, 23 Nov 2026 10:41:38 +0200
Message-ID: <20261123084138.723275-3-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123084138.723275-1-razor@blackwall.org>
References: <20261123084138.723275-1-razor@blackwall.org>
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

Assign the TCP listener from server_map to a UDP datagram for an unbound
port. Without "bpf, net: validate assigned socket on receive" UDP receive
uses the TCP socket and the kernel crashes. With it the datagram gets the
normal lookup and the client sees ECONNREFUSED. Let packets the program
does not parse pass, so the ICMP error reaches the client.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Martin KaFai Lau <kafai@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: John Fastabend <john.fastabend@gmail.com>
CC: netdev@vger.kernel.org

 .../selftests/bpf/prog_tests/sk_assign.c      | 36 +++++++++++++++++++
 .../selftests/bpf/progs/test_sk_assign.c      |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/sk_assign.c b/tools/testing/selftests/bpf/prog_tests/sk_assign.c
index 10a0ab954b8a..804087a19aa9 100644
--- a/tools/testing/selftests/bpf/prog_tests/sk_assign.c
+++ b/tools/testing/selftests/bpf/prog_tests/sk_assign.c
@@ -199,6 +199,37 @@ prepare_addr(struct sockaddr *addr, int family, __u16 port, bool rewrite_addr)
 	}
 }
 
+static void
+run_udp_to_tcp_listener(int server_map, int family)
+{
+	struct sockaddr_storage addr;
+	char buf[] = "testing";
+	const int zero = 0;
+	int client = -1;
+	socklen_t len;
+	__s64 server;
+
+	len = family == AF_INET ? sizeof(struct sockaddr_in) :
+				  sizeof(struct sockaddr_in6);
+	prepare_addr((struct sockaddr *)&addr, family, BIND_PORT, false);
+	server = start_server_addr(SOCK_STREAM, &addr, len, NULL);
+	if (!ASSERT_GE(server, 0, "start_server_addr"))
+		return;
+	if (!ASSERT_OK(bpf_map_update_elem(server_map, &zero, &server, BPF_ANY),
+		       "update_server_map"))
+		goto out;
+
+	prepare_addr((struct sockaddr *)&addr, family, CONNECT_PORT, false);
+	client = connect_to_addr(SOCK_DGRAM, &addr, len, NULL);
+	if (ASSERT_GE(client, 0, "connect_to_addr") &&
+	    ASSERT_EQ(write(client, buf, sizeof(buf)), sizeof(buf), "write") &&
+	    ASSERT_LT(recv(client, buf, sizeof(buf), 0), 0, "recv"))
+		ASSERT_EQ(errno, ECONNREFUSED, "recv_errno");
+	close(client);
+out:
+	close(server);
+}
+
 struct test_sk_cfg {
 	const char *name;
 	int family;
@@ -255,6 +286,11 @@ void test_sk_assign(void)
 		goto cleanup;
 	}
 
+	if (test__start_subtest("ipv4 udp to tcp listener"))
+		run_udp_to_tcp_listener(server_map, AF_INET);
+	if (test__start_subtest("ipv6 udp to tcp listener"))
+		run_udp_to_tcp_listener(server_map, AF_INET6);
+
 	for (i = 0; i < ARRAY_SIZE(tests) && !READ_ONCE(stop); i++) {
 		struct test_sk_cfg *test = &tests[i];
 		const struct sockaddr *addr;
diff --git a/tools/testing/selftests/bpf/progs/test_sk_assign.c b/tools/testing/selftests/bpf/progs/test_sk_assign.c
index 3079244c7f96..4e8ae7b7d297 100644
--- a/tools/testing/selftests/bpf/progs/test_sk_assign.c
+++ b/tools/testing/selftests/bpf/progs/test_sk_assign.c
@@ -178,7 +178,7 @@ int bpf_sk_assign_test(struct __sk_buff *skb)
 
 	tuple = get_tuple(skb, &ipv4, &tcp);
 	if (!tuple)
-		return TC_ACT_SHOT;
+		return TC_ACT_OK;
 
 	/* Note that the verifier socket return type for bpf_skc_lookup_tcp()
 	 * differs from bpf_sk_lookup_udp(), so even though the C-level type is
-- 
2.47.3

