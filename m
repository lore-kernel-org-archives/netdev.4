Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556451;
	b=UeDyUgQfQoHsHIEbmYT1Ku0NiWV0L7rwjTC+EPH/mDbUfMiyTGtIRQUD6Ja15bqM10W1
	 vhLWzZTe1xVxgdNNQnSMdF+Ou1ktpCBePM5p6Dcqpttp9a0E/ZRuZHMvyIdyxNZl2GCCw
	 LWOtSIYt3T/fz2Ha+aSxIVoPJjg73G7UvK1uz1gPXU5YcILQ26AD/ZRzvpduGqxs069eD
	 LaWwYbCcG9RFqa457lcQu+AFd9R7hp9gza3VeavAEBrERIHp466oNxgewY9iDtVdMZtQJ
	 vY7+ol9ip0w77Wb9bhB5UGE+Mr02MTKk4vMgOymw2vczxMflz4xAXke2eu1Af/++EiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
	b=OBGoRrVVSDR9+VnMFvul6LdpwSj8GVs4xHTP3NjGcm49K8tlW2boCSaVqrgOS9vGO6oK
	 6aGOJG2W7zXC9GvZ9ixKD8Q1VSJSRlJHwtHdg23BV0Rs/mH/tmWrN57A7bsvPJT/9jd5F
	 Q02HoOlQdLKbs0OvTUbzYjvKhlFofKuDy3WlBp2aLzqD9bP8gs3l9k973Q9IG+sLrgKJV
	 uAPJyH9FY3YqONzJzttGzZpFwbGrnXSwp9YcNTSA49Jp4JHUzPyg95YqO6q+7HLbdPYQm
	 H5Ka3LjQYW+pjyIi1RUE0pKrdJV9YVScO80B9KnnoUYskbIUkaIfawm9+1RT9WKq1NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F2606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8F2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a8eed31158so417541f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556449; x=1796161249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=tgNL8acBEFQiM09jqOQEKfm574cwa75oomLxVmAtzuC7msa6gwol4we64P9TRE1Dc7
         LXCA3IsW0m56tZnI0CQeb4Fm1L16FbwhcFbLuBopqGuvQRkrQNqL/neNI+9lyy3tn2PC
         f7coVRR4igE1DnyCqM1TZPV4Wo2SF40eBunmfhsZKzbfpatP7f6FHwEt/UPqFDXMdrbr
         yrGkO50XrHR5wyHxAKbkhWCwhQPLQeUTsIW9jKerUd+roFUgp5zxSlATOpCLFjL7eit7
         hNNj4fYtUfT7ndzyR8mLaNequNVrryrkOwM9FgKaxtjHwzgDreB2Yuq9hbI+Oou3lm1Y
         YSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556449; x=1796161249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=w7/DHMONET5rhbcEbWZM7prTnwQ4iL319h5ufWxVuf98NeprNSXj76069sbh90UzZ6
         mIPkc/W6lrUj8Uvl0gbMUXhXoHyBrBfp6SB3XSjyQnGDndT3VNaXFeM5vbsPYBb3PFB1
         ilOiaTLzfwsDDsqasrpKmy3rZYbsSZqBLm8xGb1lRH52axjKvACm4kgOoNvmsl9M8SH7
         CpcVny60F0DeuxUJJsu6a/EN9DwYavs4ld4zVVBMlzFd7BCU+TohJ0ihGuNQX6vfokQk
         VHphH/F2USPpoE3rfvCZHeKaax21aVeiXv3NJqzTcr74SRQWNUMWuYdsaoRqx2sbGa+9
         jMrQ==
X-Forwarded-Encrypted: i=1; AL+hErFqAJ10XC+c6mR4G3kjGSvKlQq9hkUQQf6C7FTkCHMM4MriEFniZyZfk4pxxJk+r2GUmt4NRr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D5Ev/8GPsWTNhGlkC7uS315Uj7cNMhOp6CHrQ9Fvmp03I2Dwr
	UuqyMw4NHhGrXOYRKTrwNO5CHKWnZQkZUOtLixlLXHw108Nhiad43l2m
X-Gm-Gg: AZFdTZcSpeYhqwlYma86M2nsrLW7xrxFUBuRpHlYrZv0TeLNoGz0RZuCzQ6g98/3tpX
	jKyatkyERM/HwCpbW6JOpyJ4K78E1j21PIIiV8lOvR5wAJ5UI5hzHQpy5/qCnWn1AKNLTNPZmpc
	el111C9zF68hPu73i/RQPo5Cg5dBmvo03IfQxkzeRrPd9Z2OC6bweZByuUmEIcm9zk1AfG76H4q
	1Ngz65AGCWR6DNPgvcv3NvADPIRp39qrZVHApi3315V1ddCsB2NS7GPZpf9JoTJxhN9xA13WO1Q
	Y/fj4IuE+euf5vO/oucPr2cnh7f/kboWZvSGo82FUCqzfQ7ZzRCM69dAbAP66PiTb+vakQH8fmB
	tfDZtTEWFQqFz0yRHU89tw9ixFZcJlQTMbvsS5URPDQI5mmD5ucwoFlb3U+MpeBO219Pi6OA+lm
	cJjDNC/Dvrt+uUJfDBLkNp+/XEO+U/UH9To0vYciYWxbV/Fuzcr0EaWWtUcUm2PgzfENiOmFHf4
	nnHQpqF0j2PIKfZ0lOjQ8t+diAV+JcciLna4IVyyi2eZeb7qsrtf6LtxHCrQgX/NaCCurm5L+nW
	Epwvv24uv2R46jc7ECxx9gNHTuP7ZgNnAbUXkmAhuwJhZCmiwVHj4Lca06EZDC8geUqJ
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr35909736f8f.4.1795556449580;
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v7 1/2] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:40:24 +0100
Message-ID: <20261124214025.11603-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=`nproc`)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..22246278e6049 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -463,7 +463,9 @@ fi
 ip netns exec $NS_DST ethtool -L veth$DST combined 2 2>/dev/null
 chk_channels "bad setting: combined channels" $DST $CUR_RX $CUR_TX
 
-ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
+MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
+	grep TX: | head -n 1 | awk '{print $2}'`
+ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
 chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX
 
 if [ $CPUS -gt 1 ]; then
-- 
2.43.0

