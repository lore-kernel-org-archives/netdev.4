Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449141;
	b=zs3hN1Wh/zBGV7U+iZmI2QJcfHCMb3hQb0gr819Qp4zprfomS62BmdlqvVatoDfHEauj
	 xLrcXQhmfFqLOJAIZOqvq7NhHoLP/gcDi7jyECA0fNMX9VMOlcAVXACW2IQVOuZmbDCW2
	 DT/FV8OZvptA1UNoUi/fomwgrtsIjQc+atf6pj3Gx34vt56EQV61FX4rzPvarDjwJLw7v
	 7x3mHRbfMbEyWSUiia/BhwN8YGZUMkmwMN3sQI6gzPYJa6kSEJQyvGCS0FTTeNbagacLT
	 XCIkX+KVe0yTKKUQ0uzhAUvLldKRsPq6rSdHtqT4kXyhvv3k3tn1baBi/vgpnTcv7uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449141;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=y+r7pUONwP1FTTbLoHoANM8U1AUoPsD9hrtijOmZFRA=;
	b=lDNO0vV2RUQH8Stxa53KtVSZX9iuSlZOoX0jKGE/NAxzv/6kf6K5alTKY+dl31vBCvpW
	 qNymKAHrMmCR6gIm29WWby2HqJOlEDE62YuXhuTJxsVPsuvqZLlc/vt7KYAbeNtA/wAEq
	 HVZzMlc/PjEJvFzI5x83Kmyzi1BJPqdSiUwkYmFpI8+L9coRKLVCaAWEcYGKoparyI7zj
	 VyDCAJ43BIQr7TcrKqTabm8MjRFQZYF/4BJN+p7GznOV+e2Eq+fw/5i3WY31x43ed38eF
	 B08GT/7Qa2UriyuZ164X9rWyX0s+k99oYYzSO43Sl6PrBUdiLtMgRreq8VWbBu1XiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQ7Y4YWC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB27606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQ7Y4YWC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6FF1F000ED;
	Mon, 23 Nov 2026 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449140;
	bh=y+r7pUONwP1FTTbLoHoANM8U1AUoPsD9hrtijOmZFRA=;
	h=From:Date:Subject:To:Cc;
	b=ZQ7Y4YWCn/0cNsAdznmHVUKJdnJ3Bej7vxfmq3vqKcmBP0MdZ6HJUKjPg+3v/QW++
	 rAyBoSy2BpLzUL+ikQac9XnXIK9wkYdObXuiG3qFDU7WJT6eKyAhFv/FigRko/GI8o
	 Q9rFoYkoR7ZCnQa1dPuiTfnW55Zml7ZejRqGYU9SraQQCSgkKeB1HFOIUWlmiC/RWx
	 1RPHagxEUMieisEFScdzjmkkikTGMiORY80439IQAmH/a0/WynGtmwtzae+NekBtl8
	 Rq8b0Tfy+9ztvF5f2nOT7kGOW5roGW6V4aYz8qFJArX04XyXxKf1M1gz0/IkabezfL
	 /ohhEnYdAx48A==
From: Simon Horman <horms@kernel.org>
Date: Mon, 23 Nov 2026 15:52:02 +0000
Subject: [PATCH net-next v2] tools: ynl-gen: avoid shadow local variable
 declarations
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-ynl-scope-v2-1-f5b8c6bb31c1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQqDMBBFryKz7hQnCYJd9R7FhcZRQ2UiSQiKe
 PcG110+3uf9EyIHxxFe1QmBs4vOSwH1qMAuvcyMbiwMqlYNEbV4yIrR+o2xMdRrZZSuzQRlvwW
 e3H63PiCcUHhP0BWzuJh8OO6TTLf/08uEhKMeats2ZjR2eH85CK9PH2boruv6AZUZ83CtAAAA
X-Change-ID: 20261119-ynl-scope-641a3242304f
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: =?utf-8?q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>, 
 Chuck Lever <cel@kernel.org>, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3

Commit 099902fc66f8 ("tools: ynl-gen: avoid repetitive variables
definitions") moved away from block-scoped to function-scoped local
variables. However, it appears to have missed updating _multi_parse().
And with the following patch set applied, a shadow declaration of len
occurred for a string attribute.

- [PATCH net-next v3 00/10] Deliver TLS session tags to upper-layer consumers (NFSD)
  https://lore.kernel.org/all/20261113-tls-session-tags-v3-0-91271964cdb0@kernel.org/

Address this by using the same set-based mechanism used in the cited
commit to marshal local variables to be declared at the function-level.

The size_t variant of len is renamed as size to avoid the case where a
variable of the same name has two different types in the same scope.
This has not been observed in the wild AFAIK.

I am not marking this as a fix, as I do not believe the problem
described here manifests in-tree at this time.

Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Simon Horman <horms@kernel.org>
---
Changes in v2:
- Use var.add(string) rather than var | set([string]) to add string
  elements to set.
  See: https://docs.astral.sh/ruff/rules/unnecessary-literal-set/
- Edited commit message
- Dropped Fixes tag
- Included Ack from Jakub
- Link to v1: https://lore.kernel.org/r/20261119-ynl-scope-v1-1-d3b0c964d4cb@kernel.org
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 4aca51396a9e..80b541619df4 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -2208,7 +2208,7 @@ def _multi_parse(ri, struct, init_lines, local_vars):
             var_set |= set(l_vars) if l_vars else set()
         except Exception:
             pass  # _attr_get() not implemented by simple types, ignore
-    local_vars += list(var_set)
+
     if indexed_arrays or multi_attrs:
         local_vars.append('int i;')
     if needs_parg:
@@ -2218,7 +2218,14 @@ def _multi_parse(ri, struct, init_lines, local_vars):
     all_multi = indexed_arrays | multi_attrs
 
     for arg in sorted(all_multi):
-        local_vars.append(f"unsigned int n_{struct[arg].c_name} = 0;")
+        aspec = struct[arg]
+        var_set.add(f'unsigned int n_{struct[arg].c_name} = 0;')
+        if aspec.type == 'binary' and 'struct' in aspec:
+            var_set.add('size_t size;')
+        elif aspec.type == 'string':
+            var_set.add('unsigned int len;')
+
+    local_vars += list(var_set)
 
     ri.cw.block_start()
     ri.cw.write_func_lvar(local_vars)
@@ -2304,13 +2311,12 @@ def _multi_parse(ri, struct, init_lines, local_vars):
         elif aspec.type in scalars:
             ri.cw.p(f"dst->{aspec.c_name}[i] = ynl_attr_get_{aspec.type}(attr);")
         elif aspec.type == 'binary' and 'struct' in aspec:
-            ri.cw.p('size_t len = ynl_attr_data_len(attr);')
+            ri.cw.p('size = ynl_attr_data_len(attr);')
             ri.cw.nl()
-            ri.cw.p(f'if (len > sizeof(dst->{aspec.c_name}[0]))')
-            ri.cw.p(f'len = sizeof(dst->{aspec.c_name}[0]);')
-            ri.cw.p(f"memcpy(&dst->{aspec.c_name}[i], ynl_attr_data(attr), len);")
+            ri.cw.p(f'if (size > sizeof(dst->{aspec.c_name}[0]))')
+            ri.cw.p(f'size = sizeof(dst->{aspec.c_name}[0]);')
+            ri.cw.p(f"memcpy(&dst->{aspec.c_name}[i], ynl_attr_data(attr), size);")
         elif aspec.type == 'string':
-            ri.cw.p('unsigned int len;')
             ri.cw.nl()
             ri.cw.p('len = strnlen(ynl_attr_get_str(attr), ynl_attr_data_len(attr));')
             ri.cw.p(f'dst->{aspec.c_name}[i] = malloc(sizeof(struct ynl_string) + len + 1);')



