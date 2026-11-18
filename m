Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983975;
	b=mGKNG1Pd5uwjJ6/fMELSci73/abRKKlCVmHfTnWSHjTGrbMm9TZq1xkTcZZySgChuVjl
	 inbKPQqj0goep5wy5jnY+P7HITYEqiKnQkDYiRnv5WlEsHsekaBKt1pXBmBEyacx6eawS
	 JeyGtWv3Wv+aB8xnqaze7cYsWd+A1guC4+aRw0DeW5EjmLcT0m/eOiDCYpbJYQh04uESs
	 4tN/SnbyNzMT1YvZClyMnaGoLXMtebm3T4dLPstPv0aQrj4MO4JBqZsAhavM7fNJI5Baz
	 2mod2Ykk4Esc17DWDGT+JBzCMsOLq3i4m+Jz5Qooz/B1b5112Y/Q7pU73mUgfrs+60w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
	b=k5uF2IiVl6T5hzfynL3zf4yyRfopUL7g+cai4v8tfQIv+JSHxbnm7owD2m6bH1tW8Wk9
	 jmG+mtBSXRmpej1JrOZ/SS4sy+OHFniWLDls6YKiHQq/MbXWvPgY10XgvXW/B/1N8poxD
	 p+hRAFUHhXmZ67IFAc195bJkunLLjw+TcF5JEvI9qbiuKDNJnLwBwiB1z7NEcLum1i7pF
	 8YpYw5OfXCYNAKZ0fo8D+1yIO3SwLMDUV8D87OyyfPE04K7I/JwyHmuPKgT4ESufH9yUj
	 Qzeda8Dqo8fyuQRsiimY1udfT1d6+jpibJXU0UdYCbt3fPgPbaUIaORd0Vplili+6bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148D606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7148D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so308836a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983974; x=1795588774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=fraUT9mFHK9og4458A+ZbVxONdM9BrGJ9bX9Kp+OXfOb9NeYDjpjCoMbZ3cosjdsMn
         txiPE7W0rSaEf6Rdy/FOVk+s5d/sQgGj6gQk10guHUGKBpu48l79tsHDhP0JZSV3loy1
         o+U+vaM7FiIUxLHy8H203NdhjTNa/PwgWsZmYJsGI6EFuy5C3kevAHOPznWFUWQRiH2U
         51eUSNNAAZGU6Iv/R/NaaPS3WRRIkms3+8XzRq2W3VRPdRnJ1VKrsqVELlStAw4b7Qm4
         WS2QFQgW5GrAXtfKCa3TcnSRclBlAspk+NpBzi+1QhTcpWQ14Kg2VjF8Egcy/6bHgo2+
         HPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983974; x=1795588774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=di9ck+A3kecPZdbHmf50Bq2pQpGoc1paln6wia7KbMelU6j7GHZlWQE3eVNXvQ2Ti+
         7K7wDj5hjn6uKgQzeBZrpLQd8RJuvZA1R+TqxsXVDrDlUa/7GBOqmaRfbT2JGmaxoZ6y
         B17WbHCnYfuRpsVpcxoVNQYf+ePQ4C7yDcvHFsGtiQunCQqUPnSENIemF61u1nQefLw/
         7/k6vEiog/c6ewWsXriJ/u7SRycD+twH9W+LToevw/dgiXrsFccvQL8PVbzfHCbNgbG+
         Wu6sl+nA9tzVmkX2UDFzE1ia5RUbmO5oq73t10Tq3SmLQ01GF176FxAe9pdxBabW75OH
         Au3g==
X-Gm-Message-State: APuU4Z+EkoIa/Al04HU4mv+5QY9Rillo5VkEkDYDQoAzihPY0LomPpmu
	4nYv2ArLifg3t/rG3WGjg6ugwRYpNaNdyB9P4chd1MKAU8Mrm01ATPrC1+p+e+VVrec=
X-Gm-Gg: AZFdTZd+1lugNASkqLGcrFMaDLMACPDGKTWt8nEil6esPmqluvwxu5kovKD7irgqPrN
	js66m79QY1Sg0F7MmxNxpZJLI98/N/PoSUntjS94zL5TUS68oVPjl2GlA5lZVqrFCdl9lZW6gn2
	uft4NI3XAoNL/fuKMn8hfJLUwwgIZ22O/eQsu2L2YeB8SXjIE3NEt53If/5fX+SHRP4ZfWWfAkI
	6jm7pv4xuoe4SYjnt2FdgNKG51S5/sJ8H0hCZziW1igFH7CF0Xll6t/2gdrV+UvASdM6qSNiJ1J
	S8W7wwPRKuxUed0eCKsg9TRILqti3Y+0m2Ajg7653Ta2xP7qRtRHX5faiBnNjW8y7oMflaj6CUK
	OIYHwLVJLdCGMqQZ9vIbvKMDuX4dweyxRMB22Ct0UtNDStEyj3f4fUUX2osiev+wMCKS97zlGYA
	OGDHKeGkR17bt5/QVKdtDnpJeVmfG1/vo/JOwqLJ+3xGLJ0RREUCUKN9mUORoY7wUgmUqJD7N/q
	VVoEoM6CVXENUXqiJn8sYrBOp2dOgr41qU8ReA9z6RtIRqK4d85guKmZ8eXwrTPABxBFyGt0fYv
	XK/mFMk4/nu5NuoYCUWVC9rEOpmQyUfIhCaiFo3QTvhlmz30jNhwpBAyKR0+9WaUj2qz3hOpLU4
	Ra+M6bSRa77K/8i28w5CkRlsMpFqBjxd/lrJb+EoZyBzQowC/+VJd
X-Received: by 2002:a17:90a:d445:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b3d06873d0mr1539328a91.2.1794983973868;
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net/sched: dualpi2: refresh head timestamps after trimming
Date: Wed, 18 Nov 2026 14:39:21 +0800
Message-ID: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
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

Reducing limit or memory_limit in dualpi2_change() removes packets with
qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
to a packet that has already been removed. If a queue is drained, its
timestamp remains nonzero.

get_queue_delays() continues reporting an increasing delay for the empty
queue, and calculate_probability() uses that delay as input to the PI2
controller. Partially trimmed queues also report the delay of the old
head instead of the retained head.

Refresh both cached timestamps from the internal queue heads after the
trim loop, while still holding the qdisc tree lock. head_enqueue_time()
returns zero when the corresponding queue is empty.

I identified this issue and reviewed the fix. I used OpenAI Codex for
root-cause analysis, drafting the fix and this changelog, and assistance
with regression-test development. Codex also performed automated
validation; the archived results are described below.

I reproduced the issue using Codex-assisted automated tests on an
unmodified arm64 net-tree kernel in QEMU, with real AF_PACKET traffic
in an isolated network namespace and HFSC ls/ul shaping to retain
packets. No source changes or fault injection were
used to trigger the bug. The companion kernel selftest covers C/L
dequeue, full and partial trimming, mixed queues and no-trim changes:
the baseline passes three controls and fails eight trimming checks;
the fixed kernel passes all 11. Runtime coverage is this DualPI2 selftest
on arm64. I also used Codex to build arm64 Images and compile the modified
object with W=1; additional build coverage is in the cover letter.

Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 net/sched/sch_dualpi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c4..79eba7209e 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -938,6 +938,8 @@ static int dualpi2_change(struct Qdisc *sch, struct nlattr *opt,
 			break;
 		}
 	}
+	WRITE_ONCE(q->c_head_ts, head_enqueue_time(sch));
+	WRITE_ONCE(q->l_head_ts, head_enqueue_time(q->l_queue));
 	qdisc_tree_reduce_backlog(sch, old_qlen - qdisc_qlen(sch),
 				  old_backlog - sch->qstats.backlog);
 

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

