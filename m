Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801413;
	b=q8IbJz+RSVY/xVlVwGRrcdQ/UCmSN++oXsytsNG+M9iA1pirRqqZdCZl3lCjy20+OPb3
	 zFDyaWoFLGwC1GNtjC6sL5sBu4Vyfdq4+qHY3M2LvvPGEqSZ0X1EIHdZ8RlvUhsJK2GoB
	 lEmaEGP8oNLJnau/9UOnwsQR68pqZ1VyQmd4WSgmyVtQQr0n3ScTqu2nrIdQ3T4ZMJ0r4
	 W3JOrgkSnotJ2sKs1N7aNdVZ4ErY9xJ4nC4t8PlWe+XHNAK10kUUl4ptCSrrUYAGwpewF
	 a82onyy9Gs4+2x6216uwRept1QBWkf7JqF7Kb+Ix1AZ/e6oB5NAJWyivMEN9xmgRiwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pU9Xk2Mqh993PZoYBYSJcD5UEr4iVVzCEZGF3w+CH3k=;
	b=0DB/iEOHV01B5pDmWyAZl3vrH0UONFYCqX/Hzy5505iCKNnQNf5gOclVlPafeN3Mnwt+
	 W26bW+xOj6ppybiLbEnplnlw9ENmbbjTn3UeqrTyg53hXZ1NgT2Xgmy8KpHk2gkMqzp9s
	 sXPIE8WFseu2u0fK4VO7h0CyLLbNHFSy5qc4iKlasd2wBQhYFiLFbyowC+DrBaCRmy89W
	 kFHVX3E2/gzKVhOk0zHpI+8bk1prqdJPH4K0ehAQSt1xPXQ3mFV3Tjl8KEJ0C7tfq/+dS
	 sYv+cpSaHbjL3hRQ9fBgBRZUZGBXSEZyd3lN2tbwV/OatWy+ZDQIm+N+RMvHfYT1D2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2lbzxZw;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BF606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799BF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2lbzxZw
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38644aedba1so12800657eec.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801411; x=1796406211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pU9Xk2Mqh993PZoYBYSJcD5UEr4iVVzCEZGF3w+CH3k=;
        b=w2lbzxZw5pzl27cd/sQqEEa0dcgRQDHWtC4WlKCzmY+/Op1n+feOzCNsgu4Qolw6fI
         SkhO6lQgGWBvIaNm3USmx+Ic4l0B+ssyTCNWNb1azkJ8WAOw4kNjGkMBypOg7l+2e9SC
         8sNBbgpW1mKfgEURVGcjjBsgeWyoIF64PXkdUcBIk0sifAN6LRwRxBfFrAuRGcXrsSCy
         2/CJb9MZUt7M5oBGDn03+GB/SFh4gj+aK9r2YHgiHqr/RIf2Bl5Ma/eYaLQxqOEz/rME
         /jwTvrgYGJyIw07G/YFRCWu6itP7Q2k4/RA/nhXOyeXMxSwwXg+7TQR4bA7DEzA4BeER
         TKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801411; x=1796406211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU9Xk2Mqh993PZoYBYSJcD5UEr4iVVzCEZGF3w+CH3k=;
        b=CwvhJaWkg+qEUNVFW0CBeCg60dxgfZdRmuMt7ZHM69MH0xABdQCQdICA+KPhPNgoFC
         /tW61hrDggi2DTKS0W1K5djBfTPlQLUzBzKXjNF3LDOku7K7puH3hDNIki+7Gclgew5M
         M1Bq58C8K28mEDVmMPKupoY7dnzzamwmevIqnBjt+hUCRjxcmvFOz++IcfJIxQzK/gai
         3TYDG63FXPiu7Qtr4k245xgK5b8ZKXwL0BNdJja94Yoz133H3CPX5ym+uZizKGovFR5s
         eaHotu2nYjB798EmOFA34C2NgIqfuwy94IW2IqyloaLXlfQ5FMakgz97JGBHrOFH21kB
         rY5A==
X-Gm-Message-State: APuU4Z99AkRceFt4mSLiYwkufdHO7Zfw1iZpqP7sn9ggrqBa0JrBv2vv
	X4anhycpT1ihXdf9ji4KeNXri6OnZs/JJGrLDX2uGzz4tK9f+R/AApmst8hnT9OcdtI=
X-Gm-Gg: AZFdTZdniOImoIydBcv2eETjQu63dLBjpXXwUVfm/pGok162KARg512LRu+xy6UxNYw
	6THkIyM1qPNh3G943d5gOscwbWeHoaEHo3FaX4gSRJOLDHOufb2nx5e+dW1iEMbBxm9oJVuPb2D
	7rVWhIcoQdS+wJhF+W1wF2vRGxOD786GrekQXxBj83OTk06IffkyyrxgZ6e7cDw8CmoY/d33uL+
	nJy4FSJWs6N+Nr2RNfhab4DlM6LJIwWC9NFXEUWfMji8gX/6KjfiOphH+dC3nytawylvhuY+LjQ
	771Hhy0nnZ+NEWKqH8yaZTRaEcDL2BlPw3CkePdUAd3/avIl4i1tpm1lDdVQ85p7bHiYb60j3Q+
	LUmN34zic4mNlEFDf9RnA4fpgnOy49ksoTn9pqeYFp+pgbAai7ihkugc+EPbje/SO3wGyvL9U2P
	GzoGkYLpDWSeKnrX1EGGvM2RFOiQa8FxXAgqIgYIBL8Q348DIRSd8ScBz5AxFdhIbduM1s5hln0
	ehuedr/dmBAQOViJbXeJ0TlY7V1cqy+7D1cMmRHzD/0HMkYEhC8vYFCNagClyT3Gqss/I2O53GF
	MU0TvvXAhT7euDlnW/Ld5gHC1xwc8Q2bzJ8lOmFH3WvXa1+tjD2v+ekz954=
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr14278377eec.16.1795801411155;
        Fri, 27 Nov 2026 09:43:31 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm66064276eec.8.2026.11.27.09.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:43:30 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	willemb@google.com
Subject: [PATCH net v7 0/3] net: openvswitch: fix a feature leak on a failed change
Date: Fri, 27 Nov 2026 12:43:12 -0500
Message-ID: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
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

ovs_dp_change() records the requested features in dp->user_features before
it updates the per-cpu upcall port IDs, and that update fails with -EINVAL
when the per-cpu-pids attribute is empty or its length is not a multiple of
four. The request fails with the new features already recorded, while the
code that takes the reference for TC_RECIRC_SHARING never ran, so a later
request that clears the bit drops a reference that was never taken.

The first two patches are the fix, split so that the single read of
dp->user_features in queue_userspace_packet() stands on its own: it closes
a separate and older oops and carries its own Fixes: tag. The third patch
adds the selftest. The series is three patches; v5 had two.

These issues were found by code inspection with LLM assistance. The
failed-feature update was reproduced on the unfixed parent 2a324a58a084:

  # the rejected set changed the features
  TEST: ovsdp: failed set keeps bits                        [FAIL]

The upcall race and the reference-count warning were not triggered;
those parts rest on code inspection, not on a runtime trace.

Tested on x86_64 with CONFIG_NET_TC_SKB_EXT=y. Both new tests and the
full 21-test OVS suite pass on the patched kernel. The baseline selftest
scripts also pass all 19 cases on that same kernel.

v7:
 - Say what the comment in queue_userspace_packet() guards: the choice of
   hlen, not head room. Sashiko.
 - Correct the commit message of patch 2. Clearing the bit in the reset
   path drops this datapath's reference to a kernel wide key; other holders
   keep the key enabled, so the packet path is unaffected and what was lost
   is a reference. Sashiko.
 - Narrow the comment on ovs_dp_set_user_features() and the @user_features
   kernel-doc to what is actually marked, and name the readers that still
   use a plain load. Sashiko.
 - ovs_add_dp() returned the status of registering its cleanup command
   rather than the status of the add-dp it ran, so a datapath that was
   never created was reported as a feature mismatch. It now returns that
   status. Sashiko.
 - Use f-strings in the prints this series adds, so the selftest patch adds
   no new ruff errors. NIPA.
 - Cc Willem de Bruijn, Jamal Hadi Salim and linux-kselftest, which
   cc_maintainers asked for. NIPA.
 - Rebased onto net 28a371228d4e.

v6: https://lore.kernel.org/netdev/20261124145033.627044-1-houminxi@gmail.com/
 - Split the single read of dp->user_features out of the fix. It closes a
   crash that aea0bb4f8ee5 introduced in 2014, and folding it into a patch
   whose Fixes: tag points at 35d39fecbc24 hid that from a stable backport.
 - Move Fixes: and Cc: into the trailer block; they had prose below them.
 - Read the field with READ_ONCE() in ovs_dp_set_user_features(), now that
   every write to it is a single WRITE_ONCE(), and clear only the recirc
   bit through one helper instead of repeating the mask at two sites.
 - Carry a changelog per patch in the notes under ---, as Matthieu asked.
 - Quote the variables the new selftest helpers pass to subprocesses, and
   name both conditions that make the kernel reject the per-cpu-pids
   attribute.
 - Move Reported-by: to the kernel fix, with the link to the report.

v5: https://lore.kernel.org/netdev/20261118065435.2367014-1-houminxi@gmail.com/
 - Use an empty per-cpu-pids attribute to make the update fail, instead of
   relying on the masks cache path. Suggested by Matthieu Baerts.
 - Report the datapath that cannot be read as that, and not as a feature
   mismatch.

v4: https://lore.kernel.org/netdev/20261115163134.3202677-1-houminxi@gmail.com/
 - Take and drop the reference in one setter, and call it from every path
   that changes or clears the recirc bit, including
   ovs_dp_reset_user_features() and __dp_destroy().
 - Clear only the recirc bit in __dp_destroy(), so an upcall that is
   reading the other bits keeps seeing them.

v3: https://lore.kernel.org/netdev/20261110174651.972936-1-houminxi@gmail.com/
 - Describe the user namespace path in the commit message.
 - Check the feature bit and the reference count in the selftest instead of
   only the return value.

v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
 - Split the selftest into its own patch.
 - Add the ovs-dpctl set-dp command the selftest needs.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (3):
  net: openvswitch: read the datapath features once when sending an
    upcall
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  72 +++++--
 net/openvswitch/datapath.h                    |  10 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 201 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  74 +++++++
 5 files changed, 342 insertions(+), 18 deletions(-)


base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
-- 
2.56.1

