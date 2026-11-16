Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818510;
	b=YFVSW4oQ1AdRLYWdH0G7+8wSDqEmQuLKCL9cBu2njmlUH9q1EaywtJE6yhw6ZA8F01qG
	 IxVyPF8+WTE2sZS9rCpcNszDTBQgHIJxu6kWgnttavaIsgrxH9dsnV8e/MWTwYx90ZDCw
	 SIQ7cE8hy54IWQNJzlN9p0o0unGMbGicPia9xIMUFGQq6bYO6y9Bq41+oBIcmlMVQdZN0
	 NpyiWzI6SMHu43HCDPva8FXfkTXlGBemdyDCgyvDZQmZR4uMKlZaKeMmKsFH9l5hzz4o/
	 OGXtoZvmJOCzzZ7fSADn7xiz1aYsBzODuyQ+22MdVUrEkwIL8lxD7cXra78Zio7RVwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=vTmasynlr0mwArqP/wmu/oBilG8ff6iDEdfrxhQNVackw6jzlXa9532bUF87ayXXwIHo
	 8oP+h0O7VYXImbjxeSBFqJAxRkqCbjar0dJbuYvLIOUXQ6bID0VpZ1h1NluoSMHlVzYsH
	 FEM+Iw7Y8GB2djxfNyLZCgj1Hq3xcHHF3wLfYQOA2/P1J0zXfFjZWkKBd1DDeFD5df3tm
	 AHYP3VMIF0SlOdSiDsvxmBgrOt3kDbcGDlAD5sXU3Ga86K5i3dWdocT/poim63dcXp+p8
	 4dDPcV6VXk07aRKJ8Jza0JP+uQSDvvIsktSZF4z45shuCpFL3RBnQe0wG2Oz5DWJL1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A21606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A21606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd16GRgR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7456745e9.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818509; x=1795423309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=wd16GRgRSa7VO6+SybNxvyCo3e+ypxaoEE943KTIsD/URI0L7FNt5Y1QxdgztsIbzP
         vF20g6P9Ktu74GZMlimq0HKk+vWaEwle6X4Svezwg4s6RXBYrx8S5z74domL7lWnZp1v
         /XMRjxSCLazvCJaMC/+r+zmbSmeWpNmUanwHqyrECn6LRLebioR7kYeyQ4az0mgpDkJ/
         wRREOG4SCTvGq7W7qQSyGbktgz+TJLCZ0QdACr6bLtQdcj5lBieMVBPjEwV2ycuHNLch
         mN4WLOER4fz3sU/0HEfVHSC17CBGoVwI9r3N5DycUvO3wwahoUbNbqP2Dp6ogpE46k7n
         IyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818509; x=1795423309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=gr5EcloEr5KRyuaBJAgFz5iz0kghvgsGmELkFmWGmhX69fAmbY6yLraEfohxDpp23D
         SDv/js2ff84aXIVhtVJHfQNgG6ZRiQJAmO6Mx1Hozw5XXosDcANeq4lG+IPSDLwAUd4N
         lb4MdxAJ5XCaaQDqKR+nGXFfn5TNLW8REJlVzFu4GpsQIzoWQb0SSucyPDtl0DlSb68J
         vWJzYIx4RFUIL3uYNif5uzZ99QGqysEJeL26i1wILtJ7p5LarJBzc4AXEYcHs5+4gr2S
         rA6uEZA6KCGbCm5Uyc8fpgKG3dd6S8RHhrhqD9eGB+FnQUYJn2R1UMlucnpfX+UijP/C
         5Jzw==
X-Gm-Message-State: APuU4Z88IU4U2Y4W0rlMi26yLnhtSqMHiq2hTlSg7Jl0krra1k4ay3oJ
	vE0uLYYcRAFSR5gFbDdXt7FpApHFK1S9yFOG0/nwumOrvNkX0PPGQTcc
X-Gm-Gg: AYBFou0bzzeyoPA1Ek4CHqa7y6VRgOmdIfruATWSKdzMiPwmoap04HPxXD9stNLVoNl
	gWGzDEOyMKA3y0Z9OYzJcxEHCWe+eqzfhmuPpzQDJ9aXzeB0Q9Qr0xqLqnqLsuRp9wI5aR6O6io
	/Mxp1UM+z7Ev8LR/GSIpBw/WQhVAXU/CtZrzevRfcNX6R2NM7lGcRmigZ8wMQiHgQfw834W6ZZi
	GKEit4Ayz9SHjtK3b+OeKjrpvNf2myVwQIpIHbkGjBW8NR4iFIKGSfnlLEZt+34XFga2kgfTilm
	k7EnxAmtueDB6W88Nau81q8l7QiSuXB7jWXsqzgWC2UkTplRf/csPfcsa8J1aLHK13+jTbdFphH
	PKc26S/9PFL938qtTZU3CeEiMFFNslVboNrhbdJ/k9HvtN2PzQzcZ7KlcyjJ5O820QBFSl4UNy7
	Shl8AlFt13Vk1QeDpczwujnLCXTDQHEXaSlRa/lu8zE68vpd6jzz0IXgJqcfIjYRW0X/qQpWfHr
	+SxElpoYXVzfyXg+1PsCPoWjeak2GNb0R3TljFzuPrNwW8u+uLtaUqcfV1G3Y0xVlP2o4lbcX1R
	C20fhq19c/mFpXs10QXR9/0WcEOPXYA2n+9q1BqYBRqMkxzUU2uFqxQfncuRjNecr1dg5ra+
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr42466605e9.0.1794818508748;
        Mon, 16 Nov 2026 00:41:48 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:47 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
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
Subject: [PATCH net v3 1/2] selftests: net: veth: propagate channel-check failures to exit status
Date: Mon, 16 Nov 2026 09:41:06 +0100
Message-ID: <20261116084107.6675-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
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
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
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

