Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449178;
	b=LVTtBTy5/XfCa6KLE2PuuJHeWMBT21OnsVoGQmyBtSoRb9EzqNRf0UyRKNmRkCJM6zPB
	 a3IfNld99/Ty5h2xE35iEn0KB/FStwObBiTBkb0kf91oNm194L19xMlGhP+9ycUyumcLm
	 ecx41LW2CKV0uzb60R+L8uf8YGOoy18BpDv4hXVjMHENvgs2Cy9cYRdLZ6gaiG0x2YDlA
	 aEH1zsIR212mJg78LW1EmhdxIT+fbXGq7BFsH8+ObrpMPgJlMxfO1rk/s4UD6MUvzkCOF
	 v7SK82uozrq19gOfSGHdnxADh01vjYirqbkMs/YpC5OQt7XUfhZGAQdUXGOmK4eOE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
	b=IpPtkX+sB7Xm5S/7xopGLjDhaqZuYidmXdee+fvSb8WJjM+ck2qaTjrmBri23zb25vFp
	 DOfug54c0IH3ZKE6SE5cCvmjuOgISAN/Vv7uOaHeV09YIIxE+3sR5LIW8gS6jPv6uycAl
	 AYIM9uGoK+NNILbV8ieymFMWk8FfhO+rgnEB+0ZbHPdDjgRQfEehZ5OejpjaPzXkj0mrR
	 tbrRe494VncvP24y4RoOREbN1dOls05gRyYWmZH7CRmlLjKje6w6J11AwKxDcYM2FeFSA
	 Y0wpXSnz0V4H0F+33/kKYO0Kx5Qy5vX95a0D/ADuI3XfGaS6vyRGQqUv0XwIPNM+1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJeSvu0K;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B280606A33F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B280606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJeSvu0K
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2299007a12.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449178; x=1796053978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
        b=yJeSvu0KDqGVkGuiZJLMgzwZfeELxwPAADjmAUBiudoTmUPYZcATBngDtQQTVQImDZ
         Dqb4yVswtYn0tTK+iV/BZ2s9uxMRhsrEHBwaahSFFMYSjPwdxsYo/0l1LTJyGXxl2N2Q
         T2kSwBxh8sM+jM1PApNBp+3wxwuG3VeKt5Uwi9gXehSYENd8nMiior4+ruVYo5m4hWlL
         Fg/ZbIbgrxYnQsCuxjLeO09pgl3NldStquz4OnS8tbKVPo2+aGSah4mpVw+H3lKfOXYl
         3tnxEqWGLp2B163Rxs7tSC1jDzneddAemCIFSrdmpUIMgTHJNg31PJVbKaKeFERjtUk0
         7BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449178; x=1796053978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qj7AT8ixrLnNnl/GUjA6F+5iIJQ7U/GQFRlgi63njZo=;
        b=xNoLGqrjowi8VEmzLKVZDvwbKOCZOa15WpfQgy96TuvFdkWOayoaSwyMCam39euf5F
         wiid+fXuLnN8T/GfEkvo8t5fj8bR0DqKGMT9LjfHZwjdZa06/pRvgBNAmh5JY3dEAYE6
         4x0d+ydktxwg5jRwZ5hCTUmzAZnTCV01QDLtU3Al06hEh/Gm7tFjVhnsKmXlHf3FG/QL
         PvUoPV0O+LczzLMZv/JfplodKPAvo3IrHVlzuvZ4ZNN1TJxNkWqOJh5RRZvYldlH5w6y
         gCcLQLEhbhkyACUo1vm+Gv5R/nkvzSA3YMu9nqU4DJK8lb5JjSjZaEB6e43Xtc+TiNt5
         DJlQ==
X-Forwarded-Encrypted: i=1; AL+hErGuqtpPfAfQBpohBGnC6gtCaR0M3mCL2oL1gCUQm3WHuIPNktrWvDY1+Tah+LMMGD5gaM1oq6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eqMqNvnj0NQNi8eHrXdjFBnQac7IJl5FEFNwW5i9emzo4TozS
	ImGUxRUbbuLOSTPtH/UL/ROVzRgB1OJico7RckzS2g9zqEQazf7dkUdB
X-Gm-Gg: AZFdTZdRPP/sicNz1nhoqG5ffzj2czcUwU6DoKH5jksVjwqJ1bd69p5LEDDg7CX5LGB
	vTAxohdFknJlSYJazIUM4hTPdxhfmr6/9ZxBhCGNYAKCUpY4aTMPa+pnDqjCLt0x4AKzJk0oujb
	3Khe9mxgOm0XOpRbhUHZn0XVAjY0OWXEklmrxhDXYlXIkvgw6rdMfYHq9qygsBE4y8ERFEEHwmP
	McoQbZeZSMNi+/NU9NtrxK/2iYszZuP5anSeN4RBy8FBsfCBEqlydbgg0hLyZ5uiGczMjQwFfte
	6ib+A8FBLXxXmOw0QYbAabV1BS2UJ4bRVfmud+9z5irIEd1JAlDmUoo1ARc6fxAo7ZgSOBW3m4V
	HDHtw9muk+bzMgszIGdwAl2asHNcUY8+SS8rUSivZnWW7JXlwLFIm+WC64NZcHiXMBNRl+1eoWd
	+NlwH+WrjMowFwCNn/wGpaFNwrIO+S/jFodsuAue4C1ofze+re0XJBpxdiLJ38IreeRrFse9aRp
	09C0+jbvpdX6pYbXdNnVM2x7nw5WWcThkIS0eSuKY8TT8VppZK0UzqSs/IyQVuCFXpMqOsB6rXH
	gykBcIT1U9/ety0u8MtpXRq6ZNQncyV4AdumFBTCfCs=
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10518041a91.34.1795449177600;
        Mon, 23 Nov 2026 07:52:57 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:52:57 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: jakub@cloudflare.com,
	mhal@rbox.co,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next v2 1/2] Documentation/bpf: Update sockmap docs for mutation restrictions
Date: Mon, 23 Nov 2026 22:51:59 +0700
Message-ID: <20261123155200.16676-2-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123155200.16676-1-supersonix03@gmail.com>
References: <20261123155200.16676-1-supersonix03@gmail.com>
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

Commit be39165224d0 ("bpf, sockmap: Disallow update and delete from tc,
xdp, socket_filter and flow_dissector") dropped those program types from
may_update_sockmap(), so tc, tc act, XDP, socket_filter and
flow_dissector programs can no longer call bpf_map_update_elem() or
bpf_map_delete_elem() on a sockmap or sockhash; the verifier rejects
them at load time with "cannot update sockmap in this context".
Commit 18f6c47d1097 ("bpf, sockmap: Restrict iter-context sockmap
updates to iter/sockmap") then narrowed the tracing case to programs
attached to the sockmap iterator. The kernel-side sections of
map_sockmap.rst mention none of this.

Record which program types may still mutate these maps, and note that
sock_ops programs may delete entries but have to use
bpf_sock_map_update() or bpf_sock_hash_update() to add them.

Also drop the reference to
tools/testing/selftests/bpf/progs/test_sockmap_update.c and its link
target. That file was removed by commit 5de7a6eaed89 ("selftests/bpf:
Drop tc/xdp/flow_dissector/socket_filter sockmap mutation tests").

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
---
v2: Only sockmap iterator programs (iter/sockmap) may update, after
    commit 18f6c47d1097. (Alexei)

 Documentation/bpf/map_sockmap.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/map_sockmap.rst b/Documentation/bpf/map_sockmap.rst
index eb466b86d..0b7fdfca3 100644
--- a/Documentation/bpf/map_sockmap.rst
+++ b/Documentation/bpf/map_sockmap.rst
@@ -287,6 +287,16 @@ The flags argument can be one of the following:
 
 Returns 0 on success, or a negative error in case of failure.
 
+.. note::
+	The verifier only accepts this helper on a sockmap or sockhash from
+	``BPF_PROG_TYPE_SK_REUSEPORT`` and ``BPF_PROG_TYPE_SK_LOOKUP``
+	programs, and from ``BPF_PROG_TYPE_TRACING`` programs attached to
+	the sockmap iterator (``SEC(iter/sockmap)``). Other program types,
+	such as tc, XDP, socket_filter and flow_dissector, are rejected at
+	load time with "cannot update sockmap in this context".
+	``BPF_PROG_TYPE_SOCK_OPS`` programs must use
+	``bpf_sock_map_update()`` or ``bpf_sock_hash_update()`` instead.
+
 bpf_map_delete_elem()
 ^^^^^^^^^^^^^^^^^^^^^^
 .. code-block:: c
@@ -297,6 +307,12 @@ Delete a socket entry from a sockmap or a sockhash.
 
 Returns	0 on success, or a negative error in case of failure.
 
+.. note::
+	The same program type restriction as for ``bpf_map_update_elem()``
+	applies, except that ``BPF_PROG_TYPE_SOCK_OPS`` programs may delete
+	entries. Other program types are rejected at load time with
+	"cannot update sockmap in this context".
+
 User space
 ----------
 bpf_map_update_elem()
@@ -351,7 +367,6 @@ Several examples of the use of sockmap APIs can be found in:
 - `tools/testing/selftests/bpf/progs/sockmap_parse_prog.c`_
 - `tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c`_
 - `tools/testing/selftests/bpf/progs/test_sockmap_listen.c`_
-- `tools/testing/selftests/bpf/progs/test_sockmap_update.c`_
 
 The following code snippet shows how to declare a sockmap.
 
@@ -497,4 +512,3 @@ References
 .. _`tools/testing/selftests/bpf/test_sockmap.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_sockmap.c
 .. _`tools/testing/selftests/bpf/test_maps.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/test_maps.c
 .. _`tools/testing/selftests/bpf/progs/test_sockmap_listen.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_listen.c
-.. _`tools/testing/selftests/bpf/progs/test_sockmap_update.c`: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/test_sockmap_update.c
-- 
2.43.0

