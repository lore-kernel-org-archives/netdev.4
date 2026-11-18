Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984894;
	b=RWD4n5aeL2thuoKuR3E0UE1y6dPX8MKra8etAShliKQZFzXpphOyRznskhYAxgB2dgma
	 vMFsTWGFBxi5nXCkWog6hgwvLR3JMlHhriBdPQlf0JbiK4bxtEXvAGoG78n07UXxBYfcL
	 tbquppf7gRFerT3mE9ufax1HcORkUIhM76JzXcUKHbkddzRZa24lOfmzN5Da1ZxLxEU8j
	 LZrVP6Gl7OjDwtZwAFA+m1m7sUGev8wBukArc90Fpn28GpfzexN3GrG3aFjo5tmMS0zjf
	 RZws5JCgi3kwQbiDxePZfLhTfGSsg7efZ2QeQg+7yovPUVmUZK5k4ycECDSDgJiZA0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uGKNbASRAWUDD5bnx4///wXi8po0trOwy1MwYu/ebyE=;
	b=zmNTi7v3ja3hm5xg2qD+aUKZ/V63U439EgKjtGCFCY5Mh+iif2bg3qhIKN5ohRfMvljD
	 AHA3KXLhgNswync2KdJvO0541L+0EL+YxwmX45XVytkTwajzF4eEI8IXs+faMWHdhswL9
	 +dd2+kYajJquRm9xEc+hgvYX+tWcTqcyRudgb5vAKeLjmGqGo+4ngzvHwYH6cyZSVWpU1
	 4VihyTHuybafZBFQbQz/HKVLbqt300GsKj9T0mSbYlVdw4F0cuw9ClrW4Fp1y1TBzeudL
	 4Ejh2L0veAQ8gU+/fY/ZXO52Z88exJXpD7ugTjZBnGRz+H7fJ4IWU7GVcNOKCquLdhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmZq2ZeB;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D37606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D37606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmZq2ZeB
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso975843eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794984892; x=1795589692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGKNbASRAWUDD5bnx4///wXi8po0trOwy1MwYu/ebyE=;
        b=OmZq2ZeBnbmnVbudVzZGINOF5SILPyruawWQPcnS96edtp02iVD2NwkHASrWlJQNUA
         3EKwqDPvBedBz5nM/mDTJgLkbaMItHZIN5fokXNtUKQTc1dHtI3AUKXW7/HBV4qatlNB
         BUVwW7JaOZ/jr5PcWsaAG2Pc0qy88QVoIfDzJylwn7AcS4mT+P+xBdC1KDnSekAP1fsb
         cuUJ3sEgPZ9t2DydWNF78U9g8ntxEEajgEly57XD7DsrFRV8T2c30Fr5eMpAoRIazLcF
         Owl611jo6i2mYzV961Mgr4GBH0NdlrdVpz7rKre7SvFyitN/otPaKWF2/xyE6G9g/KCi
         by2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984892; x=1795589692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGKNbASRAWUDD5bnx4///wXi8po0trOwy1MwYu/ebyE=;
        b=au0z+yF6wPCn4a/irGgaR52Njh9isX7lg8uy3hwDM1XeRWrFNLVAoqX46LOZZHi/PJ
         jkS4BWjF+ZYkeDzejYOxRExeqVU2oDSc04XTf1MXabeO+y9clk1wvCM7ZCbxw/n9fTqA
         OljIjC8OOyM4mqljI7trwxxYyodIlOtxIuueoh64fdJFMsiVcMWQZNTGTLMY5KUqlZ4x
         bjNdp2F75hXzSALg9IqDl8yrKsKk6qgE6b6+uaeFdY+mQNwM5R6mf+3se3QAlUb9BkBC
         +pzM8C5yhTOf8T6TX0gPNCvK9yLN+uZYVUuM4G/iiJQ9ZDIgucyOx5OvuTa+Gl9uFOrX
         bPcA==
X-Gm-Message-State: APuU4Z94+k2xp7vqzzjTwNtpTDDZZGbi7w5J3rC8MfxuLHtW7S7CNoLT
	x/qaYsJRoftzOhGPBUQJztqCJq0grV0QYVvc4wr0b86mTckdM2LaDYE+JBhCZSkGrkg=
X-Gm-Gg: AYBFou3r2V2tkv6DeAi4laFbyfKS7CxiTiQ3N7V/dhc0E8QW4I/mfi95ws59C5RiS10
	i6RQGM98hh5FK9LRZL4/SbsGn3o4vWN8eamFj1vjFYYMPXiY5c0CuHyzHKl59YwQlj6/SufdpuP
	aYU/p95reZTpgqe/ktO3m+Hl7z2CT1EyeTxP5F5DBYD9QFR5e7BdPfp0lRIB4sBu3OB6ZBljyyV
	4vsq7B63B1uSN6CFq1nEucDAscPAoosW5PV4LntcXny2UdEi9WBzLOxllrd2H7W/VN1YVMKv1EJ
	YH2JyfbWO0+5k7d5x9x+fafD6c43vrxfSZu7Awcy85eLDQ1ONbNlKz3Nghmx0dwfugzGbqFVtK7
	uNgBVik7LmapYGlCMqke/tHx5wWjiS10RbcN/g2kgHZqPM/J23JPAtqBljWog3UZtNMzfIOaM0+
	R5B1OOsFdfbCBaC90BIYu6fCReWGtnqqIp3vLBe9Nd5MT20saS8okDP+JJtH25UEMGA3q9j1YUQ
	AO4cPoSk09ghDOpsXlfscnbla4mRMm0JmexCH/910CapB0qHT7YwR/+1ETuakGViq19ThUfIfwC
	6y/poKrH/T+Mv5DhzDndkjeZ
X-Received: by 2002:a05:7301:f0b:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-3828007a784mr1564917eec.10.1794984892012;
        Tue, 17 Nov 2026 22:54:52 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm4612640eec.28.2026.11.17.22.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:54:51 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v5 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Wed, 18 Nov 2026 01:54:33 -0500
Message-ID: <20261118065435.2367014-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
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

ovs_dp_change() records the requested user features before it calls the
update that can fail, so a request rejected for an empty per-cpu-pids
leaves the datapath claiming a feature it never enabled. The tc skb
extension key is a reference count shared with cls_flower, and the code
that would keep it in step is skipped on that path.

Patch 1 fixes the ordering, and drops the reference on the two other
paths that take one and never give it back. Patch 2 adds a set-dp
command to the openvswitch selftest tool, and two tests that send such a
request and check the features the datapath reports afterwards. They
fail without the fix and pass with it.

The problem turned up while the YNL spec for this family was being
written: describing the ovs_datapath set command meant reading
ovs_dp_change(), where the ordering stands out.

v5:
 - Rebased onto current net.
 - The two teardown paths clear only OVS_DP_F_TC_RECIRC_SHARING, so a
   datapath on its way out keeps the bits an upcall in flight still reads.
   A whole-field store clears OVS_DP_F_UNALIGNED between the two reads in
   queue_userspace_packet() and pad_packet() (reported by Sashiko).
 - queue_userspace_packet() reads the features once and gives that value
   to pad_packet(), so OVS_DP_CMD_SET cannot split the head room decision
   from the padding decision either.
 - The tests write their diagnostics to stderr, the skip message
   included. A copy of stdout stayed open in the daemons the suite
   starts, which kept the kselftest runner reading a pipe that never
   reached EOF, so the run hung after the last subtest (reported by
   Matthieu Baerts).
 - A datapath that cannot be read, and one that reports no features, are
   told apart and reported as such instead of as a feature mismatch, and
   a failed expectation carries its own description.
 - checkpatch reports nothing for either patch.

v4: https://lore.kernel.org/netdev/20261115163134.3202677-1-houminxi@gmail.com/
 - Rebased onto current main, the tests say why they failed, and a
   datapath that cannot be read is no longer reported as a feature
   mismatch.

v3: https://lore.kernel.org/netdev/20261110174651.972936-1-houminxi@gmail.com/
 - Cover the recirc bit as well as the dispatch bit.

v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
 - Name the two paths that leaked a reference and fix both.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/

Neither leak has a test of its own. The reference count behind the bit is
not visible from user space, so the tests read back the features a
datapath reports: the reset drops them to zero where a test can see it,
and a datapath freed after a failed creation leaves no state to check.
The alignment race has no test either, because it needs a set or a
destroy to land between two reads of the field on another CPU, which a
functional test cannot schedule; the patch removes the second read
instead.

One thing this series leaves alone: ovs_add_dp() returns the status of the
last command in its body rather than of the add, so the "|| return 1" that
follows its calls cannot fail. That predates this series and every OVS
test that uses it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  58 ++++--
 net/openvswitch/datapath.h                    |   7 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 195 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  65 ++++++
 5 files changed, 310 insertions(+), 18 deletions(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1

