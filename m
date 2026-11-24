Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479172;
	b=0SqJ8oLP6SmrQJaB3/NVhSJVxYkXymMJzUAfFCbbqDssHjqMP4El058kGc27lJALDMo1
	 9/8OvRpc7GTri4wgu3tpb4QqTUQ7gQ6aEdZLh0yPrcfs5P+om44hTsxl8Y/XAi4U6dwhV
	 vMehKKXs6P50shKuZWCHxI13r6NBSpURKxGV4PgvgaFSmuSQ7fZrU4XdJ718Pyru5uFVj
	 E+vGofaq0yRLNaTmFMP+YRtiEKg2U146NquEWeJsvVAn5YExpxZA32JKitz9BrZd8JztJ
	 T+t5Q5GfUlT8jgHJhXVOJuyhQi51ZIZPqcLftokAzZW59/7jwv9ErSq846BJ4Szk1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
	b=vL/xaqve0d1k1nHW/dXJ9rRDEdZVd1psjtiTfts5ceg6uGc5ZLBV9bb6lb5hZ8p3lrg+
	 g9bHQyUN320Y5+bsUi51zV/uleX3gUfppuhS+hhZtKHaNX3V1efHWjPhThipCeZptsfbj
	 iJwTD5n2ItsgE8j3dWdw+3jdwEtPTlpKd+NG3ELEoi3v0hWslCS+bvFdI5aCaxBeQQ3/9
	 4i5yCUCVmuAlJzFpdSMyHrd9oIp+rCvX0iCl6FuerRchQFVzzVhdieFqzOle74WpYUbIW
	 U9IFJsZzz4MiezB8njPVYIlps8P+annhZQTPvS+5yF9VCucGgtqxJqwVPP/bHq0VqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72122606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72122606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvzGf6z3
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1866528b3a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479171; x=1796083971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=EvzGf6z3rhg+QVwRCNjiqtCEZQCgcOG6ShYMP0kcI8BIeTc+i+i1MBX1jcLv86gWPK
         nyHsqBHq/6w7+m9DsSBPB+vW2wMewdPpAMBY2hX/Uls7uEq7FEl0qbsUwWhAxBAwrC+W
         +S5cCZa8peiG/UWSsGfsCamGsA2WW+N0Ng8wgEG/f8tHfVjaETAJGRpi4zoOJVmSk2Fk
         yMKdj6HtQbbkDpc8+pkb4cP7A8uDYL+GEkEZIYMBDAuTLKWDOZC5Yh+kvlrf0QrZ3MgU
         xHDFWEv+uQAg/q+KqS+6yXIIvnoFUGR0Y1VT7IFBmxqe7g1OrYn/zB5z2DbJlOn0IIOF
         B+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479171; x=1796083971;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bDIHXXIM4LNEtaYASA3zw1NmzIi1pMS/QPwvnMhMAg=;
        b=hxQP1xPPIaqu8wcuTV4aZ+itZY7HKJe7jeIi25tt6OzC5ELpH8umyaP8QhOXd+GsDn
         vg2HKboDONRFU+q5lUCjTB0+PCMSW1gnPXZN3iLwF5cQX9G1NeBO+aAkZFIM3hSVeTWo
         HZgZoCbfvFWxOqmyis3otsS/gjVWdOgg+vK8PabLHXzo2v/b109VDRzUaxmU5chIWRLu
         WRs76VvnKtXvITaND3arJUwv3Dfi2fGTYC+h2vkr4bawadGfsueWC4u9g/DxT9pvN72i
         Xut3jlekiiHvH2I9ARMxJRuikBSQFFk5tNCSTriLY8CMTJFmfjuOjgIMdrFFjAFO40N0
         YoBw==
X-Forwarded-Encrypted: i=1; AL+hErEhiINTnKw1+TwdKxzCv2TRb7Qz9EqRcUlQ8Z2Y2OQwZ45tq7nCpTYKN4Af2iKP17HpFAaT6RQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uDDct4AQ5zWe4hCF3mqvMVqSN/nIJPv0aKtTVg0tJ4aHHuOlk
	OuU63hfREpov9qh5NvO+li6VjMhWAnlRMSRQ4pB5ZvLrz/HJDBu8qd4e
X-Gm-Gg: AZFdTZdo0p3q8sQ+R4FmbuFQJLbfoh2ed9QKXQ5RTNIGHikgZnuafdNDKCQ+vG27vSs
	W5HDW3cJ9C/yYSIbLZ5I1iKVIW1v+RaXbsnbbcnTp1XM9p/uZuELELaUbDorei7MkjM30tr/HSq
	7FZo9KABFf/tBo9Seb8mhRv2hgLdogEWQpJPJsDrCmHBZhhKW2Z9m+61A15uI1MVTjobQLjj4ak
	XTFGW6XbwKjPZAef+MxStBONmfrb4y1YsmDWVksd/LkNtFf/SgC9Ea1uYodDeEj0QlIP0spS0c8
	iIXWap9G8/ezBNLEwv4YMY369pOieVTDyuvAc/zlpw6L3QDiddnH/PyRrAAa9b+AoL7iEC0fktT
	IwmU9ci9XEGRAoLuGtTkgEeT2qDKuPOzohd2JgSskDa5uvQKHjl5vgWeg1T/7YJwqUKOLC+ESRK
	A+hdx5XJkY9RXCY/C59VcpU5I+3l9pmV8t6Wz5HzWGtgxcz6To5B2wi+AuFnmENQPIqFWqYE4Fj
	KBDF3ql7s0E5y6aKCgXbeLha5y7VaUpjbwQ9LB00XVZSeKK6/S1CQ/hJG1o/J+Uc1lidK67TuwO
	5jMysxMZ9YAQZmvEfRFwfQIBeV9AVucSi1xz34Chxe+ffX4YXiVNrrgxY7ryjXCjNpUAXfvrDxc
	Ac/3bsl+73phLjXUMvizkLle/+t0kq6JoZw==
X-Received: by 2002:a05:6a00:368b:b0:89e:b12e:7eda with SMTP id d2e1a72fcca58-8c8792c36afmr11522943b3a.7.1795479170548;
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b278f0sm6298093b3a.51.2026.11.23.16.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:12:50 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 00:12:47 +0000
Message-Id: <DN308UHY5QHQ.8CJOFGAHVVTR@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "KP Singh"
 <kpsingh@kernel.org>, "Matt Bobrowski" <matt@bobrowski.net>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/9] bpf: Add log support for tracing
 link_create
In-Reply-To: <20261123152743.19629-1-leon.hwang@linux.dev>
References: <20261123152743.19629-1-leon.hwang@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 07:27 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>  .../selftests/bpf/prog_tests/cgroup_link.c    | 324 ++++++++
>  .../selftests/bpf/prog_tests/iter_link.c      | 156 ++++
>  .../selftests/bpf/prog_tests/tracing_link.c   | 741 ++++++++++++++++++
>  .../selftests/bpf/progs/tracing_link_ctx.c    |  17 +
>  .../selftests/bpf/progs/tracing_link_multi.c  |  36 +
>  .../selftests/bpf/test_kmods/bpf_testmod.c    |   5 +

1279 lines of selftests for log messages ?
This is way too much.

pw-bot: cr

One row per attach path is enough. It checks that the log gets there.
The base kernel leaves the log empty, so all four rows fail on it.
Something like this:

diff --git a/tools/testing/selftests/bpf/prog_tests/link_log.c b/tools/testing/selftests/bpf/prog_tests/link_log.c
new file mode 100644
index 0000000..4f7e71a
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/link_log.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+
+/* One row per attach path. It checks that the log gets there. */
+static const struct {
+	const char *name;
+	enum bpf_prog_type type;
+	enum bpf_attach_type attach_type;
+	const char *func;
+	struct bpf_link_create_opts opts;
+	int err;
+	const char *msg;
+} tests[] = {
+	{ "tracing", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, "bpf_fentry_test1",
+	  { .target_btf_id = 1 }, -EINVAL, "target_btf_id" },
+#ifdef __x86_64__
+	{ "tracing_multi", BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY_MULTI, NULL,
+	  { .tracing_multi = { .ids = (const __u32[]){ ~0U }, .cnt = 1 } },
+	  -EINVAL, "4294967295" },
+#endif
+	{ "iter", BPF_PROG_TYPE_TRACING, BPF_TRACE_ITER, "bpf_map",
+	  { .iter.len = 4 }, -EINVAL, "iter_info_len" },
+	{ "cgroup", BPF_PROG_TYPE_CGROUP_SKB, BPF_CGROUP_INET_EGRESS, NULL,
+	  { .cgroup.expected_revision = 2 }, -ESTALE, "revision" },
+};
+
+static void run_test(int i, int cg)
+{
+	const struct bpf_insn insns[] = {
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+	struct bpf_link_create_opts opts = tests[i].opts;
+	char buf[128] = {};
+	LIBBPF_OPTS(bpf_log_opts, log_opts, .buf = buf, .size = sizeof(buf), .level = 1);
+	LIBBPF_OPTS(bpf_prog_load_opts, load_opts,
+		    .expected_attach_type = tests[i].attach_type);
+	int prog_fd, fd;
+
+	if (tests[i].func)
+		load_opts.attach_btf_id =
+			libbpf_find_vmlinux_btf_id(tests[i].func, tests[i].attach_type);
+	prog_fd = bpf_prog_load(tests[i].type, NULL, "GPL", insns, ARRAY_SIZE(insns),
+				&load_opts);
+	if (!ASSERT_OK_FD(prog_fd, "bpf_prog_load"))
+		return;
+
+	opts.sz = sizeof(opts);
+	opts.log_opts = &log_opts;
+	fd = bpf_link_create(prog_fd, tests[i].type == BPF_PROG_TYPE_CGROUP_SKB ? cg : 0,
+			     tests[i].attach_type, &opts);
+	if (fd >= 0)
+		close(fd);
+	ASSERT_EQ(fd, tests[i].err, "err");
+	ASSERT_HAS_SUBSTR(buf, tests[i].msg, "log");
+	ASSERT_EQ(log_opts.true_size, strlen(buf) + 1, "true_size");
+	close(prog_fd);
+}
+
+void test_link_log(void)
+{
+	int i, cg;
+
+	cg = test__join_cgroup("/link_log");
+	if (!ASSERT_OK_FD(cg, "join_cgroup"))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		if (test__start_subtest(tests[i].name))
+			run_test(i, cg);
+	close(cg);
+}
