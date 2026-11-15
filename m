Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781463;
	b=3lQbXGBrYm70zHI41JtO6PX1w3iZ/VSoJpgBVL/LZedtyXAv8ArydzHAE6Vz746NcxPd
	 CxW/1KsxIrXrOgRV9Vr14OM2bQREEzeB40fwhVyUWx4hiHfmLoT24qpg2AC7ub/QJ6wEt
	 4csKl7KHLPcQ+5xP3qgOCM/NeWItwLwMQCchQQjfm6564Xogb54mCl4pysR12mD/fd50t
	 a1WYR9y6aafPGzOOURNXrRAJJLKpxnAna2+UHXby1Xfw6Mn/sJmtI6FlK8gtGK+6+pZW9
	 BsCpeixMswoVEW9ypU9lcJkG8a2peSCs7orib5jb6M3PdwApum2cknUp3h+Jq9LXh7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
	b=TSMH59czXw6Q9C2lzrnxM8h4nFP5hBzCzp/BdYaVlfkHB1Mjofeawodr1TJfOttwUoKE
	 Ruxjawy9tSa2u6OeX6uHGHuUJGeD8ynVfhfHcKsbAenQcf5ZIPmagB/6Gd1sBxd/Z9/NF
	 nJ5+ORFK4Wz9RYf4ytMc6Ge3TYnAUdxV/ssLED9Pb0o8pW/S0IwFE7DiamV07bq6mWkNb
	 +FI043r0ZdJ2zT5UkOec4PcxcGVNmYAqxVNHxhsDzbf6KGA3Uaa0D34NwR1yKBjpZ71Vv
	 ZP8qhfpjrJic3wTI7Z1mg8duCNmGJ6CyOtiqCI05KhlsBugQY/b5p/bZfx2//Dgqtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D9606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49355a50d11so168013f8f.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 14:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781461; x=1795386261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=b0yQvjJekO3PSUHhKhHzRM90blA1jqgD+9bqFw0785WKtWMeeX8nmRkizPtKugB50f
         4kgzzDXw1Okb2pUL7a/b7Tlv/deMoEF5qF8zy2dFFOCUYgKe8nsWi1eHuFmrlhDYQHaL
         xsLCJVUxO8TnwStZl74hS9tEP5Mc+iefJrwGIDhNGFnv3J6X9Xul109RTbeT5hL+IG0O
         TsH8tCyncH7AkvO+8j4h50MfyhIA0y/gycUXQ+MaHbbPWisx+jFygrjVVRZGHOb0jIAu
         f0wiRZr73uG4dXAHTvAs0h83ErXcq5F/jvpJ1dxxyQ9S/ptVF36pS3M1GMkuPibPiODQ
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781461; x=1795386261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=MNHVUfO7wkknBxAwgein2F5OWRfu6bYHXsNKE/i6riGoXmrj+YwXtRiTwBA8xeZrjw
         IUib/6+am5oWqO28mcdp9B1W/z4thD8FTc4bvGJMaZQZV0DP0lGfciAY3iz3GHEwU97+
         MnqrUFd/Zen63p52GCaUUAmUNdvQI6jOJ3qupC8bXGWSo1FWoivblMbDVEEpCYj9unid
         EJTEP+qbobSV+PZnzRT8JJEHeQKt8UenRjB4PjkoFGPjclkb5hz9jNxmtUWiYUAX++WG
         xHHwikbLniQzqEQYb042xeucWb2/cyhhXpz8WKZESzm2QYkipAnO+civkr6ZwUCuGcoz
         edpA==
X-Gm-Message-State: APuU4Z8B6omSMeLotG+7A8AHEfHhQHFErKWNzJFlhqr4fmOm5Sr5PBo+
	hItZ9Na07Ug2DAdvZnscZ/UuJQwGFBRCcK6Y5CZBVxrPp0CK20qjLLwjhZFziRD0fRxAMQ==
X-Gm-Gg: AYBFou3cIq8XTz8jXkwDX8WkMTT++4pqj+m0Kg6WdLJtP20qPpt8nkUisaCd5Y+DbQF
	zyKBNz1Mas1Q0HBAJBmZ7Yki0laAANqF6Mx1tpEKdznuYCZgSU9eSV+AoCrVjuGMgkebxmK5+LJ
	SA6FW64De/exSYTleYxtsxfFEjhtvgSyPjFakOSNA6jns0zHAFpnjeuzv9qtKPS07b2rcGZFtcs
	OxYaq4xOa5EYWWZH/nwkmBSP7FgwyPUw7kQ/VJ5QVV8Dofl4NOGmURXF68G2bzIEFQFIP15ucoW
	J8aRKrfodZBLAtz9gP2rYrEbPzZm8qjLe6PYeFeiPg9dAz+NAEGHRyM+PO/GU3m+YvbBQJxrXX+
	cDt/06Jy0rY3XLxBsQvEArwXt2HiMM+qr0021d1Ajz8a82dePmJdfvr3ZiamaSTI8qydEvJcGZI
	KA5noehcYSs32nLooSIC/0mK4qqvgBMaDZcbm69nw3eCjnclugDJ1JzziGuBCRlK8qaMCKdEcQh
	c7+UBiV2WeISXiV4KHxoUvFuTtCJxuHVMnPbxwYeCrPCflaHF/m7OdZGG21kbYN+A3Xe1KHQQOh
	vKOQo1RF4zp7eQqgubI7OTFmJz+GDTDMu3gJLiCw5SVeWEbpms3VYOqX3pgB4WS8mbsBYAON
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr28190285e9.0.1794781461202;
        Sun, 15 Nov 2026 14:24:21 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm346050855e9.4.2026.11.15.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:24:20 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	po-hsu.lin@canonical.com,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net] selftests: net: arp_ndisc_evict_nocarrier: propagate the last test failure
Date: Sun, 15 Nov 2026 23:23:51 +0100
Message-ID: <20261115222351.52930-1-emmaonana18@gmail.com>
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

run_arp_evict_nocarrier_disabled_all() reports mismatches with a
"failed" line but never sets ret, so the script exits 0 even when the
all.arp_evict_nocarrier=0 test fails. The 2023 bulk fix wired the
other five test functions and missed this one; the v6 twin
(run_ndisc_evict_nocarrier_disabled_all) already sets ret=1. Set
ret=1 on mismatch.

Fixes: 1856628baa170 ("selftests: net: return non-zero for failures reported in arp_ndisc_evict_nocarrier")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
index 00758f00efbfa..4afb953a3e479 100755
--- a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
+++ b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
@@ -139,6 +139,7 @@ run_arp_evict_nocarrier_disabled_all() {
         echo "ok"
     else
         echo "failed"
+        ret=1
     fi
 
     cleanup_v4
-- 
2.43.0

