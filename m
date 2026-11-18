Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991567;
	b=k6IbEzmASWCqb7ogsj/qYII2KhrpGZVYQG8HXLcGWLj1zcl4m+aZVpHMqdpj4I4JXUQF
	 gqTKOqNW+d0rk2gtjEgXBi9FXrED9sEa8uCQM7BUa07N7VzH/OSjH83lZtELbmet156/0
	 NwguTXkzwB+6p1UziuCC/4eBmm6CzA2x8VEr+9INssDDLLlFzICD4E1Fj9cU1FBX6Pymh
	 9/KRB1N8kyEi++6DMdkRD7cpO+9ivrT2UafbNJhUSEkx+qoTNjbodPH4qTFRIyKan9Vlc
	 UsosaFsVEZFJOSZGgOSeXGreGcBjR6dJMiWArgtqJsBz87E1rqeojduf7ljcnCre/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
	b=yqx8TW4FVp3Asb60P3dJ5VFIHqJtZdkCNfs1MLqxxHWu0Aay91xDBGyaVbXdwS3tJfD8
	 Y3mx+lay9zPEgfDSN5Vu5qKAuTpY/ILHi52FR/hjFymciC4/aqyEdZZwDXUY3317CYMie
	 VpdCEsEqQCkAMzq3usHZh2ZOajdRJL8gTSiJ08CM7114p2VHqydlO77U/a6SfJFQ7snJ2
	 4ArjS3kxzKuGbIz5dLUr0dMbVxSGdLgsUsliNMlGFltxjU5V146zbmC/VYU8ig3disGbq
	 Xd2EoXE7za/bKVHELFbCLV1LVbfWHZJD1T/hNGTvc896uem/mw6ptNGasuEbgTyzy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F82606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEW8WNWB
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ada81853so806746c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991566; x=1795596366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=EEW8WNWByczu4ke+zSMCDWYT3ytnREhs02FtgVDVy97uFVL1M63IfMMn7i1shDNIKY
         EHSikcxcfwuXcY0KfiJy6NQEm98L/FTxMsIMMWTrnD+k1ngKNWjyIYCAaCTKsf3cvtNS
         2RzaOW6cjqRgjb42qoR+vz9uP66wtSwosjEi5ZwXSudA2RIVOUvqfEqWBgrcshrgkmrx
         ZrlL3LSBpgqvO8fYOTZxP9c8C2qbTjPSLhMJ99yDNDotRugINQDbFm6lxFzBZQ8crz3w
         OXmmDDcMlxKevtFaB50JGyJVMqF2axaLqGv03HguhlbVU/sINHXD1T/jFB8xE6MrbaCE
         2npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991566; x=1795596366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rH7dHadXHQBCAb1xibb6d+8zPhNSRfeCjnCBhbphGSo=;
        b=EHKjZjBwdV/cHUAMUsAvZIHtQl+DRb3ohdn892iFbKz+YbBsxedCqaRaxITDgU0WfC
         /+2BBRnl3JE2SgKljrod6UaMKezEVhV/KJnjJNjm9XVaqLZWQ3w6J15Pel3NlqBV+ewg
         91APhAzhwJ1No9bQ1L5EU1z/ZmXcL7cuZE/0KHGHKz/IEUlEoBB+8OpAbW1rhPVYEuG6
         fD1fjy8oZdO9VhXW46Nmq3v9hoyq51KkC8UeGDsEOPwLmk4xS1yu/W+E94ag3hJcMbts
         E4bezn1i6CPZDYTkZFwVJaGJAokFdSdOKOtzvJ8DBZdF7PT/KD0uLVREF5Cm9tj72w5o
         gzow==
X-Gm-Message-State: APuU4Z9vHXJEg0EDXC9G0wglBs3zR4h5AzYbSJolZw2OBlvK39gAO9nh
	IH90W7vVdeCmdWj3XmaqDMPr2DsH51Itzjv69SETZfWG0p24L8jqtuWSdiR3meqN3aincJG5
X-Gm-Gg: AYBFou3jFPHoGqQzpDVeFsYAUTcH9NqZ3HPCoxVaEDUVS4Qfe+yFoErs4P8Yi11iKZS
	WMEWzFjRz0idFBqP6RgTYfZ50Nc1gMlOCswR4Xcahl/IFh+QolNcShcPo0v9wKFNuAshSNQCgUr
	uEdVp5h5NtJ7VWjqSjJHi8m1suoCOg5ZMnpA6eqVFzIasfYdrKQai15ypUiHyWMZ/Kgm5w6DRjG
	vVopeOOeoCisoV9XFPh6a7XkxICaG6TiAQv86A6h7mm3y+3c0AmOl66JIcGdXa48fw7BgT1zvnq
	8dLnBosfhIkOyhnEjScsf0NZ7MCgCmqakdJIZOSwU/EK9c98xwWh7K0Ycp1C66S4/fN/nxqKSY2
	ZeasOmUTll15EkEb0vwtKD6yag3G2E1KraEhRHMuN2wo/qrLw5JEu1lon4eCxSzOgsYu87yY3az
	yMYkz0bvdjCM9TQ2O4qfCws2wgYQNnqj63qPF2ESQGqWL/BdEvhkNhdSFqzhmFT+d+2xpQ580bf
	cyi2c9ssuMtkWh1SuztuyL4UldNnQIjyYPYbU4PvVS5lI5inK4ypruoLuY+JrK538ViIFRnzWig
	rAKHt2kW0TV4KcJ///azypzjrhFTnEi4AeMBek/g+hS+W1Wtc/NgvLD+
X-Received: by 2002:a05:7023:a4b:20b0:1b5:32d6:677f with SMTP id a92af1059eb24-1b543cfc722mr1753116c88.34.1794991565842;
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:05 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 0/2] ipv4: allow route dump replay with nexthop IDs
Date: Wed, 18 Nov 2026 16:45:08 +0800
Message-ID: <20261118084510.332821-1-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
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

IPv4 route flush fails when a route dump includes both a nexthop ID
and its expanded compatibility attributes. This series fixes the
IPv4 kernel delete path so that existing iproute2 can reuse the dump.
If a delete supplies RTA_NH_ID, the ID determines the nexthop match.

The first patch limits the mutual exclusion check to operations other
than deletion. The second adds a regression case to the existing IPv4
compatibility test. The route type and IPv6 changes discussed in the
earlier iproute2 thread are outside this series.

In QEMU/KVM, with the same unmodified iproute2, the new flush and
route removal checks failed on the base kernel and passed with the
fix. The three selected kselftests passed all 36 checks with the fix.

Codex helped extract the IPv4 kernel fix from the earlier iproute2
investigation, add the test and run the baseline and patched guests.

Earlier iproute2 discussion
https://lists.openwall.net/netdev/2026/10/26/186

Yuen

Yuen Su (2):
  ipv4: accept nexthop dump attributes in route deletes
  selftests: net: test flushing IPv4 nexthop routes in compat mode

 net/ipv4/fib_frontend.c                     | 5 ++++-
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
