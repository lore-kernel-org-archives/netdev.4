Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285382;
	b=jHi3UN4FVa5jN4JrkKc0aVnIlaV2dCVFyDn3YasysGDr46dx/8Z/JHNjjX7V46c3Hrg3
	 UDSUFYUCy+OCkmB1OFpmIz1glKZ0iqlufBd6QmQPoDdyLBSXd2UMXRy9YTrFqxprrVVKX
	 VTFmYU5ufcgG3JG3URHFQ1p62DqYguv5Y4UsTtZR8yqmQsFCaAUmDoMvnD02RJP9s1I1q
	 Gh77fy4UW/tKxVXaTIQjoknRuR7cR6OXe6w8mI/kcIghigYFXRgrFFkSY7k13qm6NimxH
	 CupxHuZrlkZ+JibPMV8GO5V5PgtwvFw+6s7LX7X/Eo4yIvcU31YrBSCQI5jSPY+EMlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
	b=yu9Kkx2mbb6t5KbfpO3+EZtanw0BPmS287C91qYLaUlL6zIDOdyed7FWhnratdn4k/yU
	 arf7SwMunDgyk1VObn0HZX23/G7s1Ny3TSxnFziHZlTPwJmKdbOa05EdqR5Y7AVMw40sL
	 8Mg+zz6vdmzKv8smdvKwuzeLGVbhBL6w+ajmBukvLsoZeEHeFOyi5Uuzo7b9KPliBWCd9
	 8O5FBcXC4w8TOi7sz2buONJzLsh+qo7iVmRgrOqxP1/3Z1o1iWtvQ9VxFRnQDij5P23hU
	 xiz6E7nLjNw9Tf4gQmV2CrWCRZcYs2h8BN6y81RiDPnedF+zOXit3y0HMnN2L8H2RvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCF8606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCF8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4af52002471so2381165e9.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285381; x=1795890181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=d+uj6aRa0JypX9ox6qZscWxSUxC7fqg0E+T3t+0FHue6GwYr0GnyLPk0milV6Qx2sG
         gZ0Yk8Q/1UC38PopKspEizuRHpxviyq0By6uWAwW008Tap/ZGuTO/Q4J55OXrLmBjNpZ
         37Ba8lvXdMc0XdwkvP0A2GIIII5oZlzqGOigeYK6wRmJbqVTd0MvYqNS5MdV361f9vQ5
         kc1Kyj31ddNQ4eUf3KbDLmmzUUkIt3dw1D2kCS+sSK05KrXgz3CvI/1dA73mt2KmcRZN
         J9mW5kvXkzgQ4i02o9lspKbFcjuns+2Cc/CI0EFUTn6e30E3RlWqrhdczIjKvql5KEmW
         mTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285381; x=1795890181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=C6hne86oSGyu3noAImNE/wmWWJEhKcsapssJgL/vRG24bP90+Gb8RI04XrCFhG0mf+
         8qzqiGqg2mJW7KhsN1i5rqIQm4jSyFsB4lM2kmmSCww8JC+tRdX+cc7ZoEtTOPZszrwG
         Y/meTOofnvBylAligdlezJlS6gw89M9vkWz8GIFnMJy7/6MSQ0lRmWjQOnCYhoTGW/EO
         teA7mCKw+QD6ytojx3mMgUrmDVM9hOGkGD+mLgtvpKxQSS1HSzMFIeyEo4ikqcuiXMmf
         66dihtwJN3RS/FyIO14i4z5pTdggl1HIZpVT6GnO0/wnaCQlxycJ1NS8iIuitmME83H+
         rJMw==
X-Forwarded-Encrypted: i=1; AL+hErHDgBW8lrf3OpJGQ/nzPdUx1wGoUD6KGSD1eKvBQVhUoI4ahQkXxHcgIoa4OjsvxEP5ZmGe930=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZkKRl72UB/PZEdW6C71wBiZYS0eMIWYqGKl6umtJsalq/XMQ/
	8WPNQXOs4+B+87+NAwbPXtwf2+siMOlR3gK+UNDMV5JAxreJvqC6V8Af
X-Gm-Gg: AZFdTZcEI+3TDW10KYO6AkfkNrA0iYjS/0Evin0Df+McMvbeqnDDdVlKdoT8BhraDWg
	MgTdgTRlqJfmEke75Si1nqOU3xQJkeTMWAMstpDUvFCQSx2tgEvUYoBP1CfEw982KlPQFwLTY/P
	IJH/rP/hdMeE/HzzNTtvjxz0XXlKf7qPWUCLgsU/Dc9c6KVu8Ji5dxeFc43y4AdjLokzOq1DxYn
	sShuxF7J8INTqvV9wBi8p2seRLE9A5ts/ds121q+CqnIFMaFyENXx4FLJUnGYS9Qi/RxfryjoWj
	exNg05/etRQRpTkAFHufFq0rszV5YCye/m2G/DyHwmzLwzEDaFG758XFhrd1fVBr7pVYodkZ/lp
	m39QgFFYgfaJUM24pDS+HuOfHEYrEJfJBtaoJBT6FQVEYzJk01vb3SUlrImVBOW4TpzkN0euudr
	1oZN3KNpjMtm/RQxq+GWRlTKigt/GMKi7t/qfOv3PiHBh/VPHfx/0sLwxO876V64Z/iioTaP56h
	gbidmfv5rUZjViF2XYiPouNI0fAddNdnBleV7eX/39ZCHb5dx2rr+pa4NI2iykVs2iWRbfdRUT3
	8TifNXBH2yUmMuKrAfDIdMThQMGon5jiOn+fBrtdrnRBIkgAlu2O0mYxuP2lWZmUFYTouQ==
X-Received: by 2002:a5d:5f88:0:b0:4a3:45b4:f0cc with SMTP id ffacd0b85a97d-4abb253e271mr13430436f8f.3.1795285380632;
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
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
Subject: [PATCH net-next v5 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 19:22:14 +0100
Message-ID: <20261121182217.4609-1-emmaonana18@gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v5:
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1.
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

