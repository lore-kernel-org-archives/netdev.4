Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530701;
	b=FyaEEe1QsEJy5R/h81puizKraKgm3m4HfsebXHlW28UhJNkaatUihtomSEXxrk4mvA9r
	 d0spu/PoX29XLTKqu8NEnRsHAKH5gDDgV9U/lCDbSSKpne6R3yHdqTurWuylgVPJmd8q3
	 VF2q2HittiOaml8lwR9Zye5/ry1nohRM6x2R5wbkwBGTbczsNBpQAr5A/3uMqcUKZSsuV
	 pUOXvXfFzYsQGOaW1nUV/uVP1KkdYEAKNZ2QCO9uNpJ78xGKUhV7f2W1tiy49DvjaP5SE
	 zZSmA+jR6sRuUQBxKTj3mOmNKUVT3oEV6wbsjjxhmr/KodzUVAT6/DkNSQL+LFcSbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jS+nnfUP/mk+uzq1WRMmZ1+p5s6g2KJ+Zyoi13aubO8=;
	b=zfzsurRgJMhgIhprRGDmDeubOUmMtjeByP0N5muiw3XodEeD0MSIUPZ+hH9NB0M+C+w5
	 zj31v2NInsUWL+cE4IvlVXkW10EZTxLA9XCAmgRLoHTO0TEpqCoiY3iQFgWW7oJILFXSr
	 KI0oukp/b3SNqhKIUmVO43fiKpYgNgKYGXjhBzQXMKs5olPPlsR7PmrU1/iPXqhq7CK6v
	 +cJxBYB77eJSiqG9Z4C6gzDRDwi9J7di2+Qk5dP1uY0uEk4rzRlEk3HLLnIb8R4/AQoLb
	 KMh+RzgniVocMDwa9jCfKunOYyY0IC2ckbQNri/fbdaAe1YLbQv6vYym/Js7oInp3RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pC5sINY7;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A4606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500A4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pC5sINY7
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3045235a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530701; x=1796135501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jS+nnfUP/mk+uzq1WRMmZ1+p5s6g2KJ+Zyoi13aubO8=;
        b=pC5sINY79C+4AgNwYCHtQsgbceJxN2JL/o7ODQlGs+RCFyL09S5SBB3jb8+RV/zu4c
         uReUsgjhRD4YOTORigQTo1Hg93FhrKwIUBX/UFc54VdocQzI8ijqZYMAv2Fk60+F4r+c
         zc2B+VML47gQVM+c4GoDFitRViVwlIptdpnSB7ROGeeMOsEUGjjOsserxv+ourBDy4ZM
         lzy0PbaK2lRCbLFkXrW0LsnCL1d5wIRcXdcEJyL2x9mDvbmG9NZQmiiEPdNmz6Ssq9pZ
         ky8TZNgnZznEB6JP9HnTyhI9osqEu1BF5MF/jPp9VdywsrtelmCPrpZbFWuRqNxUpgiy
         Zqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530701; x=1796135501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS+nnfUP/mk+uzq1WRMmZ1+p5s6g2KJ+Zyoi13aubO8=;
        b=EaC7uGXthc+PO0lUFf9eMkMN60CGzSjBUoG9r1a4gp+L8IGTAI9faePnSksDW01vKd
         QXxSSyI6n0rHOFGvXqCBflO+eiKmgFPZKKehbEhdyyuHgFGCDFFHRYGrdskuT7iYdSDG
         m6aCTHURTYqBnDXyU2qDEM8VA2rUp6UF0ARt1WhTkVjXh9PBND/HVuKh/4VaWhy2SZgp
         /vZVhM70dvBUOK2vhzQyF+yNfXXs6DDsgVX2fv6P37dU3OEt2P+ACzoqXXgH1tMaw/pN
         Je0IJbBfvj9KhChbxnCnVkG97AwvyFsAjKN1uvpoK+XKMwuChtxBkyZYjGr7L7jXLOVO
         eWMQ==
X-Forwarded-Encrypted: i=1; AL+hErGlZ3aeUovazk0/A3I7Pg8QJo+kEP+3WEVUGl2hS9cV7OFvekXGjJZ+w7JsaEs2efGWCicw11A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nWzBVM/6dXJEGkUAan+wfwwuLCg2C3H/n7acnhO7qg7W6WUR8
	lTj6GZ3Gp1HA4rIyaftPK5HeetTfvbr1FwjAQwP+stgGntha0PUomrGm
X-Gm-Gg: AZFdTZft3L7RwdyqJ8Hqmr2MbksyN9xZFtOgP8CJzvbIWQQhszVnBxf/dx44dQa8A2d
	bC7897SWTkUin0Xh4eNchG7hxI57nVysbn/1rjQJe/DmDE0XDDr4px+3cKhNz2PhzTWXqrJuAcp
	URd0U9aIPrBOxLQlQhq73vGzWgRtlRmPn/5sgwdt2w8i5+riiQp2Wc0xcZVMTdXdLPmQ6KHgzuK
	U/NtJAzHwjkhKMg/RaroH5GlC0QXqI2WWFQ5lKzmpa03OQZ3g483VNeBl/ROmzwwV/oU0YBxlcb
	rKZN41jX1zKTn+saAx6ox2ROhTbihgnl+PH7G/XB2hkayKasgOW7KAQTXGY2I/KgdK/VxbgOWFd
	JXix+coA8NMNNqnyG1QPva423tznmpcM5kVnHPGUWMWXQSh3fjJEBKGdqHeDxPdb8dvsrvVlvWm
	R9DSrWdbDdTxLCv8iFj0NwDUX82NqLomRtM4CGYA5Tiwg8LLR8mZI6dC9E7vEKSKLiSCXECta8n
	y7zPD19NPJyVpCjkwvSuTgoXCX4hjDFjCOuLVPM552SaQWy4CC1IHWNJJuNx+Qb69l54l9sfKaT
	NEaMu2SMsWHlHIUbvehcJHu2bR509NAJ8Y92gihdjVg7Dd3LhVGblgQp91HSULKjpzHk+sRCxV8
	MgbX7MZzQOB0=
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr13597888a91.23.1795530700477;
        Tue, 24 Nov 2026 06:31:40 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm7171737a12.8.2026.11.24.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:31:40 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Amery Hung <ameryhung@gmail.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	David Vernet <void@manifault.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: [PATCH bpf 0/3] bpf: Reject sleepable struct_ops programs in atomic context
Date: Tue, 24 Nov 2026 14:31:12 +0000
Message-ID: <20261124143123.1182108-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Any struct_ops program can be loaded as sleepable, and it is up to each
struct_ops to reject that in check_member for members that run in
atomic context. tcp_congestion_ops, Qdisc_ops and smc_hs_ctrl have no
check_member, although the kernel calls their members in softirq, under
a spinlock or under rcu_read_lock(). A sleepable program attached there
is entered through __bpf_prog_enter_sleepable(), and lockdep reports
"BUG: Invalid wait context" at its might_fault().

This series adds a check_member that rejects sleepable programs to each
of them, like bpf_tcp_ops does.

Sechang Lim (3):
  bpf: Reject sleepable programs in bpf-tcp-cc
  bpf: net_sched: Reject sleepable programs in bpf qdisc
  net/smc: bpf: Reject sleepable programs in smc_hs_ctrl

 net/ipv4/bpf_tcp_ca.c | 11 +++++++++++
 net/sched/bpf_qdisc.c | 11 +++++++++++
 net/smc/smc_hs_bpf.c  | 11 +++++++++++
 3 files changed, 33 insertions(+)

-- 
2.56.1

