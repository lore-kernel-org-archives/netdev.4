Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114999;
	b=b+XdcGjkjn53gp+kiwEjTW8Oi96Ho/pIVuRDG7quRMzuctKVhedm0qV7fYIe+RmO4Xz3
	 v8yDxLITT6KRJafNbvB3rHJPi0rQio3kkuUkBdLpxcitwdf1WOTvId30MM/AHMtAGS1Pu
	 p/c7vfDhQOd1tX6IXgELktY+R+KMPs0fCxqTWxBLdDW4fFmnI5SFl5d+HwMJCZZ1TOIYX
	 peuHojc7fykopTUmk8k9tNSmHBDzTAxt6KgpNRhAnM8z/XTZXfKif72HdNhXkn9stGE4L
	 5I6aduAiqLxoYyi2d61VgaJS4ujM2k9Wg/h86G+OTAKKhfoawOm3K2Vvb/ZW33/70uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=noma71YAi1AblpT3LF/AK8Tl3g24zJWcHPiAOTlLv6U=;
	b=Vd0rv1E7cKK47YHUiCg4jEu7joPmXXZO8KheyOb6HdQS7D+2UHl1DdtMNgMOha8P4Wv6
	 q/HsUy/8JcLqdC2iH7BZTZasXHbVrSP80QUKAWeSa6UTc3VLWXYNh0qdhzxrDdJKHHSeR
	 SikhXngc/plVkZGs7hNq5SLhrdOPfR/fOyc/MfPZZYuSQVAY8lP5wog90lMVmWq74EAUp
	 UuzzFQJ1TqCu69MfmML6Ot2XfFm5eFvCyM8ik4G4pMZ9tWNIQrVFrhLRlk+MDw2HYQEl5
	 Z/OQO2tJJMA26rDop5TdP0FZJNVUPHrrRgMYKsQtax5OV8CNWAheYMWEOt5XsIYV91g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lg6vyWdT;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660560A260B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2660560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lg6vyWdT
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso552985ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795114998; x=1795719798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noma71YAi1AblpT3LF/AK8Tl3g24zJWcHPiAOTlLv6U=;
        b=lg6vyWdTTEHwnRMArUdgGQ8n1BvONjZLNYDkKODGiVms6QvHBiCVUldtHwaIv9hfQB
         4l6Y3dX1/jPbidyS2RMqnGgXaBCT4azftGjFPu95P2rfNy4jrekZ5pptJ+3Q/WJA5K5i
         KjaVG+tcpHghe6xEuOJhae0UH7xOYBdxwxz+vs2P9Fy5+DB5Xj2LIAVc6K8y1Q/XQf7B
         cP4pI1P9tNwWyf6JDwRF0NJN9BqMxbuT+ZCQeuF0V52DCJ+h9zKbtWp9wsbSiEPat/MK
         zRaGJ72zX12hJQxhmISvrwkXPTyGPmiHbrtfHhCAWmTzxZLwRmpG6v0e6kbHpsHkaa/t
         lV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114998; x=1795719798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=noma71YAi1AblpT3LF/AK8Tl3g24zJWcHPiAOTlLv6U=;
        b=TEikw+Q76COLVUE6I9muCJ3N9YymErJopw18LwKU9AscAB7YdMUOug75jCKTW8VeWO
         +k8io28iVc/sQETOw82gjRjzka09hFvLeoon8ihkPq98sHs7OLm9GBMBh0qRgg2pgN6D
         J/QkdvaxQgk6VJP5EpTonbN7oELfbmqT+wE6pjqv2tpxrUzOHFLReirxrKG4jFVO+uNr
         JkfrYqApm1mCahlfT+cTLbuXEOSvagMp69Bc3tfYrbcfo0Y6p3TzIuW0jHoWwKWr/r6X
         0M1DRj+fYOKA5E/aYMPU813joln+SsOJTkNEvM67DfheG9jeoKzLlgm5epp/z8VPzEpt
         +ukw==
X-Gm-Message-State: APuU4Z+UoHVsZg9STs8Y7pFGAnlyIB682tu8PLGWsh0BaO+G5LdVa81n
	mUxqtYuy5WfxL1KqVwHLIwTHdVgZwHclFfN8r6dcZMMfdHssaPSWW5WuMBeOBJ7yeRp/HNueJzl
	1AFDE6hw=
X-Gm-Gg: AZFdTZc9f82NWJAW+0BEaE2aKJRkcNX5dfwUgm8NmxNXOrTAmuN+Bg1+3JAW4RPhxev
	q2ovONQvfY1dYIte+EwJT+qyhmRiM+6586Sst7nHp1nsgYsODc47biI12IMerePXQnlmhdd3NDZ
	It75A6iQBmN+UdGF2uvMkRGTxET3P5oU3WspfZ4lO1gR5WUoNzhakXCfoahZWvp1ik/4IhH8Ode
	12M043HBsDMyS28dejpofnvJ51JCrE/DRzXk5AXOJ6poe44/hKM14x7QTl17ulK0aRAFZUzBPM8
	7Doe44WzX3SwLnvXmHxgSVSBAWY/5Vzj0Ypdeee8Qm6YGyKIV6LUqUc7D5c6/DRCc3DBneXlyva
	xTmf0fYvWTTNbedqLYwBYSmFUvnMPMb03rHr8+SdpawzjUpNevnBI/yuxsiE9lUJ19BVW45kJiZ
	EZHAlurJg121xVpzklJ4ofPI7oIJxCor4iciKHCFbDQdgrFlONZqbGAGRu6Kcde04+jRUJMVlRG
	c9IfI8zYShIKmVsPTTEa+PdBiQDfu01iTuQNSKn+6bQbBahzDOH2fBPm1klYbVVS9Klp5nTxczb
	eMG2P5+ZFVofSMI+qPe9INWv31HfQmpGW/gXegmOnKfsYTxEFI1Vjgzi4fchVMbp7dsO
X-Received: by 2002:a17:903:f83:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2f03f1d09e3mr6941875ad.59.1795114998465;
        Thu, 19 Nov 2026 11:03:18 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:18 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next v2 4/7] man: tc-bpf: drop references to the removed eBPF agent
Date: Thu, 19 Nov 2026 11:02:39 -0800
Message-ID: <20261119190312.578885-5-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
References: <20261119190312.578885-1-stephen@networkplumber.org>
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

---
 man/man8/tc-bpf.8 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/man/man8/tc-bpf.8 b/man/man8/tc-bpf.8
index 0e38e69b..31bf2ec0 100644
--- a/man/man8/tc-bpf.8
+++ b/man/man8/tc-bpf.8
@@ -235,8 +235,9 @@ rather resides in a text file.
 
 .SH EXAMPLES
 .SS eBPF TOOLING
-A full blown example including eBPF agent code can be found inside the
-iproute2 source package under:
+Examples of map sharing through bpffs pinning and of altering classifier
+behaviour with tail calls can be found inside the iproute2 source package
+under:
 .B examples/bpf/
 
 As prerequisites, the kernel needs to have the eBPF system call namely
@@ -435,8 +436,8 @@ provides eBPF helper functions that can be called from an eBPF program.
 This man page will only provide two minimal, stand-alone examples, have a
 look at
 .B examples/bpf
-from the iproute2 source package for a fully fledged flow dissector
-example to better demonstrate some of the possibilities with eBPF.
+from the iproute2 source package for further examples demonstrating some
+of the possibilities with eBPF.
 
 Supported 32 bit classifier return codes from the C program and their meanings:
 .in +4n
@@ -503,7 +504,7 @@ struct tuple {
         long bytes;
 };
 
-#define BPF_MAP_ID_STATS        1 /* agent's map identifier */
+#define BPF_MAP_ID_STATS        1 /* map identifier */
 #define BPF_MAX_MARK            256
 
 struct bpf_elf_map __section("maps") map_stats = {
-- 
2.53.0

