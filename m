Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105847;
	b=l6K5SMYZMwWev9nE1zm3LQRGS+3YPT8/8SxTggVzYfNzqXsltzb8A///f8BkSAWHHyNt
	 4e+9p7flpNRtx3yQZkCRF02TP8uFf31PpLvXlB74B1jThXyCeYPmj7Z4Bx5AxuBozH/sk
	 MpoDQSmeRybWMQmmU5n17wMXK0ErEhz5io3noyIOyc/oQ15pyzzpsSLzV40I3Ok2mQ8LM
	 YyDpQQoRTYdiO8S9r77lzXLweaPc4r59RPzwoZWm2JIjN9+JuBJsRICCbv6fBALivJE/0
	 JC0Q83EfbRVoqMW1sRp+pMPWIyxrfTgs+5vEt9WCIxIdTJSW/rb/B+HiAzFJoHZGoBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105847;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=EkYRALwBnLqcpaD+sPfLr4ZtbCIl2Etf5c33d6GajiE=;
	b=fJkn1BQAuRFAWFtl9j7eovJGQ+G+9SsZj9Js0PiB9JzXBhXpLrQuZwHmPdvmvk3gx87I
	 exHfcEURB5EoMGnMQ9zXyNNx3RKRIZJm/8EUf6nEOTaNcRBWBlyfGQgsoEx6k6PYTbw8V
	 LVu/CIWbCeSJwJFmJdYZ4TebhvlipOHKNEkOJXKiJDISiIO+ATkya9FUdoeg0iHjq5uQI
	 zvF168zukhJFEEYqQFbNUt16rJkq1h+UdsaZ0BR8Jo1IZCY+WqkYFzZ/l7pdIeTqrIUM7
	 PT/ClbRd58ZGCSWnkSRvHhkJ6R3BX4cpByYmqaQVw5dVqjJinK79W73rxWzYmCQ+mCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSoaBXNB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA6E606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSoaBXNB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D59B1F000C4;
	Thu, 19 Nov 2026 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105846;
	bh=EkYRALwBnLqcpaD+sPfLr4ZtbCIl2Etf5c33d6GajiE=;
	h=From:Date:Subject:To:Cc;
	b=fSoaBXNB0S0F8wg66kdKSkJEogQPtdlyxrCh29CWYeocKSbs6HqIqx1adVXM74PBP
	 dnDHG6pPQlhQmu+7NAQ/DsTH3yB8WGp+0L+MbHWaSvhx3QPa0QdeaT3junZANByddC
	 0lBXy9X/x6qfjHkFozeYUZFAjXwJjsFxKK+K5z5Jn3NsZx6h68Bi9eqAWKNsfdjPuQ
	 EwQ0Nzb/kQeGaRncOYPuJJQIpegwre2djgcWkGk1tT3bMowosbabctoe7asSfw3y8r
	 RNXe8U5kqOUoyl5OpBBsT4bgKubE00WR9ylmNr1Nm+yRHlcZvfOieUbDc9ICqy3EDL
	 96U2EGidiZdBw==
From: Simon Horman <horms@kernel.org>
Date: Thu, 19 Nov 2026 16:30:34 +0000
Subject: [PATCH net-next] tools: ynl-gen: avoid shadow local variable
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
Message-Id: <20261119-ynl-scope-v1-1-d3b0c964d4cb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAMAwAwa9IzgZMLYJ+RTyIRg1IWtoiivTvF
 o8Dy74QOQhHGKoXAl8SxWkB1RUsx6w7o6zFYBrTEVGPj54YF+cZO0tza6xpG7tB6X3gTe7/NYJ
 yQuU7wZTzB9d30pJlAAAA
X-Change-ID: 20261119-ynl-scope-641a3242304f
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: =?utf-8?q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>, 
 Chuck Lever <cel@kernel.org>, netdev@vger.kernel.org
X-Mailer: b4 0.14.3

The cited commit moved away from block-scoped to function-scoped
local variables. However, it appears to have missed updating
_multi_parse(). And with the following patch set applied,
a shadow declaration of len occurred for a string attribute.

- [PATCH net-next v3 00/10] Deliver TLS session tags to upper-layer consumers (NFSD)
  https://lore.kernel.org/all/20261113-tls-session-tags-v3-0-91271964cdb0@kernel.org/

Address this by using the same set-based mechanism used in the cited
commit to marshal local variables to be declared at the function-level.

The size_t variant of len is renamed as size to avoid the need for a
variable of the same name but different types in the same scope.
This, however, has not been observed in the wild AFAIK.

I am marking this as a fix, as it does seem to be a bug in the cited
commit. But targeting net-next as I do not believe it manifests
in-tree at this time.

Fixes: 099902fc66f8 ("tools: ynl-gen: avoid repetitive variables definitions")
Signed-off-by: Simon Horman <horms@kernel.org>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 4aca51396a9e..c037ae8ebc9f 100755
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
+        var_set |= set([f'unsigned int n_{struct[arg].c_name} = 0;'])
+        if aspec.type == 'binary' and 'struct' in aspec:
+            var_set |= set(['size_t size;'])
+        elif aspec.type == 'string':
+            var_set |= set(['unsigned int len;'])
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



