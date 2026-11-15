Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779237;
	b=E6s5+DgISJtR5E9aXr23mqgZiA9eh/MceH3zqjEZuj3i9mr3uyHo7j7UPR9PD4WCNrzL
	 jYAMTmHOmieCYgUKcJIW2InVeatM3rag1yd5Mo9uHE6CwD65SnxACBkBgalW8OWRieCZX
	 4+C2/IqHOD5psd+W/V09JCAyMKvCokqt2lzk1eWFKVz90JYeR/yyVxqi4lfp4cSApowTq
	 nVypTnhsBAjQW25nXklOHAAYuUd8nSzmp+9DpOqd6cOLWtPIrbp4dV58zz+X1p5v1k4JB
	 ELU+Dn/OPHo1GojjnfMfvKzt4Y1Z5Z8SziyAZ6juWx+4XLs4zURWwTpukjHtLnHSLUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
	b=dLNd/wxEXCwJdl8m7BPpygd16pOotk6qm/rYjkkLaaJAlAp0fVFQKeMI06vOi9it+tmk
	 z41zHxPfpZmgYgI5Y92h8UUEFg0Z+ELIv1kUyaIX8ye+hzpFm68hFwxttW9+/2MOzfIU1
	 /9ZDKuphFoHKrDR2vvKz+BcrNEdCXL4KOIIJsSXbcarQnQo4VxHnLftjumAq4uTfldkZT
	 +IZa7D67pUf0O0Vn8w83r5eNxY5kDqgZfFmoawEiTZ7nSIklSulkaPigwEW7vIV1Fee1q
	 I0sSdA8mKTxeRiPIdmHOwTsLiyADS4a1LGbHSzXzKQfhA9GwBd4CI2a0O3MkLBUUBGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A01606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0vogCSl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso356105e9.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779235; x=1795384035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=i0vogCSliLZJGYDRv14NGvoJrO5SGotB1IECpyR/cQn7RkJjcbXtZ15LN3HdYRuzJK
         3ghnZOKGJad3pty8zTXUIZyySoqi8t2T6QndoUZVwetLEruinA3Q23qATRL9sGf1hOf4
         Z7Vc7cAvyNjD8JJ8NLUXTZqI6ZeVlaC1M87vbmcRfiGsVmZj6cLm0rggjPOMTeej35rb
         hpi9+DgGTyVh7vvBbDkGkrVt9fQAn43NYaliIguXV3JrZaBTpt9dH7BGClgcmthhrLOo
         aOBH+5LgzrDvj4Wo//E5vupbxzwtPtwBU/4eJ9RBWvtUstHxE6d7ZyC2C4Dghe53V1Z7
         YZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779235; x=1795384035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psvhFR3gX3h277fYLdFab5gaUTS02PdmPaUdlYbgfe0=;
        b=T/SJO8xJfL9SOUzNkptlD0OqItj/0WaOsT/sghXa+84HzcWlCao5CaHwNWY5M0UpDu
         to+F/KxZClMuiWOWgMo4R25HxCTt/MaFTi3o7ccicBdNDLAOsloR8uXQn4/n+jCjwmB9
         Xuj/hI23q82ketubyLbKI5m5A8cxkwBepTcusiMNok6fW10eMSQYZBXIbrJy902Xa7KV
         blV0ON2qXRh5yL6yucJiTLcPfqCcUJvZNgBpBu0ULW7BpnuEzvR9ELCN8mQ75E6rvxt/
         uvqsVkhX4R6+OOZMw06HEulgiqKzGD6YbtOgX71u5F0wjDwwvTDQ1GjsbhK6ZQUeiyLf
         i+4Q==
X-Forwarded-Encrypted: i=1; AL+hErFr9I1tLNm3pffbebAvF6N1sx6G99DjSZAOXRss5WPX1AxMZYIc7gEoUGyz0eNO5v3oUP4FVhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5UIgdnF7larTsOZVuBZMjQnrvbO9+Ij83awhXe3PBHGlHcha6
	qAUas5LO0j32Vb5aKDPH/p7JOJ25GFnmgd83/RgcKgvF2l6r7tfJi6tM
X-Gm-Gg: AYBFou2AvUci0dbBDQaGEZXcIRSlVsQW0iUdJRH3uCZVEDNdrUmYD1ODPOTCec2zKhB
	ndSDMgOxV9A60+YRdMpWSRk1k0Q1JgXhQsDcAkDxvqlI9lf2ahwtvc34NEjHgXpQqkjzZAVwJbB
	trxP00Unjnfl3KVm4xTEPdiSUFzXIQhBK8CWzD4tfSfKnHwrBCI33aS7SJ1C9iLOo05o/yrFn0r
	vepN8HK4xbxVx1GhyblgNr2pmJGUbspOSpsChDG8MpoXCk67Sidt55N8kuYMC/qdsMJUTgVsA//
	I5+jB1Ig2Z7q58jCXkBLW5xwwfc+JhxRCT7ipeCtsuHyXSv+l5CPkYXur2z4UHYirWV6CTe94Zy
	Ul3c+LW+5VBu18u15h/f+yTQ4TevI6L03TJWVseT3qk2yWtklqYvLa+Ncz6lSIFXXqt+ByfDBBS
	wB11vFPWhFdCb3Y0yGVMlsoy4Z/Vj0cYnW/xmGyD2n+8IoYdsLGZPkruudPdcPC9uLQLfyWKN44
	XZ+/NTfSOA5mtyBtmNg0JwND+kcDj1bWREDn8VmJIO226gnuI02Z1zfQWm0E5nQoVZLofZ2A+vA
	Rmi7RKvrGWdcDwUtS1bZfJ/DIY8pPiV1ZTz0Sh6/oQK2Oj7H9x+Ws89wRRo74R+IKnLYdk0y2w=
	=
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr144632065e9.0.1794779234728;
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6f93b3e9sm43204765e9.1.2026.11.15.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:47:14 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 22:47:02 +0100
Message-ID: <20261115214702.50817-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2: correct Fixes tag (was c017800af5c71, now 1ec2230fc721)

 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

