Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531847;
	b=V5zAxQiZUfbUAEz+KVpzgpZ/ansF9UeZevMrtsYy1mjlckINBG7w4FYg0/W+/87jtDi0
	 DSynK5fBESE013WxbHwfjbc8S+1dVJM1bV99W7xucRS9Xbg47KPy/iCLRQBOKmDgmedhD
	 PjNK9tJeZgV7hZVEEffShKibaJQajx/4jAUXopcTVBFUWRETwZoKrDUS6789PrxrtUef1
	 ecrVSQ1kwwBNkVGRhNXhZoCpCfQQajYFEkNOppUAAyMfRKUtT/pKeERapI7oM5reA1Q8n
	 vz39gO/73SclPqd/IfGVgS60xY2HM8aoi181yHtNAwfbTg1QGDPhJMfd3FGbrWdn98Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yi15pLoRk7FZdubOV5ipLbERmvfuFwrSzH0tDZUqBY4=;
	b=c/MEhrUsQOQq5ZiEIr8rbMNP4x9QDOawxQ+y2UyMcB0Zg4cZ1kiRBcTMwjJ9hkOoigVE
	 tkbgQ+bJ4Z5FfaGdVJOUQEUCGSKf0X71kfnagYMiqRVTJXt8pg1taEVC8zJkiHJ23AwOq
	 XIdQRI58+rOXnP7vNEDd05mLegZp7ju1NeEoXGh6NyJHESCygOflQBDLe4PrgfB0X996z
	 /IgGb5Bprhplm0XGcViN5kIPFwBClpypwghMyr5pTmbxtNc9f1aw5KUSijIuh4IfwSX2F
	 YqV4UL8Q2vlxvORw8Dm+5b87Ofyupm8PDGw+XVp1dsyqCwcpdTQJflbUaHuvkR8cA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR2xf9aE;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A24606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR2xf9aE
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3869f03af6aso3814071eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795531846; x=1796136646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi15pLoRk7FZdubOV5ipLbERmvfuFwrSzH0tDZUqBY4=;
        b=tR2xf9aE8XB9Zki1SPbS67OlYTGHa8Iq4dVZv5FW+IHDs7IXPaG2YAdCZV4ZGbaUIS
         rK4FH3JVKlLZ/OdbMFtDl+IU3lqJ9r5YMltBnpXuUGsTsSrECmlODOTXKjxy6n1CS18B
         SofAPiH+Fv1EaRgBilUVhObsVgyIo4UTYHS7LVch673SPljik2JHbs1dCZ1TZXq/g1tb
         HnasDAVS4Dshfc5zd5bC9OVCwn9Hl7OOGakrhXuZBEmckclX1kAE2ihaG7gk/sbjLnqb
         BfT91pYQyfXCMsm23OxUrnn2c4FBsbsmfGlnujpzURXKlGhodiEn8blUlI2nHDNAiCTP
         zeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531846; x=1796136646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi15pLoRk7FZdubOV5ipLbERmvfuFwrSzH0tDZUqBY4=;
        b=kxZlXRbpyWiMHRUUwpsopp1xPkaPXQnioSCaxHDZgHy/jIWFCPitqPAmSyL3Fj3e8F
         JhWnJCNEW5FP1F3RGuM0QkJwLuj9p4iyEd6NaLqILivdIbBiikBxTfupclSCmAeFKT1G
         6exQAwV2cyoUlKBoPwOD/3vViQn7daFf9TmyeVlOUiOXQcxBpvN/mlSEU/4QurBQEk6G
         tLFESmXIOAgAypDKRTeu/5g/zNySSCQY9R/a61EuvXvac8vbMDRMX8v0eQYlLwWceiX6
         tF9+tZ4GEe82xlrAJVGDTXXpB+Qkasqb/1/GGc7GDMBXFTyGP7jIoQeOgGS/Lvj/Of7z
         xGow==
X-Gm-Message-State: APuU4Z+kXqfdqTGDgrsEsikV4dxGsURg3uQNkHrAYgY3RVn19QwgFjLE
	kOOmNQgrW32WdcE5aEc+AHHqqbTOsmdFsERSx1C7OenFKXX8JMC/Kpm8tt0wLPpWBhg=
X-Gm-Gg: AZFdTZe544jSrTQ9wfKwyn1PV4DlgGnwzTGxwI6OJBIe+ZiQCNVIGL770HPZ7UIcZ5y
	y3rTUC753qi+vb4G+rFNw5ttdPcvSWBNXBRbIsREdFup3te17p+wiGfv6VY4sONs18aI/GC6Bt3
	1vkQktsHmK6jnfc69xB/6oumKKhpNC4Qbb99aiU+J7kMHDynHR3cI2YtXl7KiwJDtEppzSHP9lr
	Ad1QUOk3ewceGuyNM8IZvH/MAhNgzBR+lQVHHXvK6aqtNEZQolIfdwHh8mPLBZgJwnj1yLCQ2RX
	6um1n/YMixQ8PA0zNvMg5dmXjEMdcXFFlhJrakaijdQDattGjhyGk51S9WUjkjyHzcDZJXnauc9
	JDPnjKpz/jAHVe+vwh84dToJuaGktSfByDmvx4MeFKDOea/zsHLNmhxROepbSHg2E8zM682xjOs
	7OkXL20ZwxMXuoCansOpMlANYaFtjLnWrJZh+692Lo0lmkq3AEuDdmHNHZRr7vd0BSB1LQURfZg
	wnwTbMYgeObUl6M4p1rZQaGSlIDKNpDDSfgOnHBGUAlJrxfa+o8cX5PmyFg3ZMib8UZM5cPfC4Y
	GWZRPQw1L8DYXr5HEcdbsAe0OImQQc5D4Mtm/qr9+gvWBegXZleFtk74hoEw6HqHRyC3V2q9mJC
	AlGPL/w==
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr14503161eec.19.1795531845964;
        Tue, 24 Nov 2026 06:50:45 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm20684238eec.18.2026.11.24.06.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:50:45 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	netdev-bot+sashiko@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v6 0/3] net: openvswitch: fix a feature leak on a failed change
Date: Tue, 24 Nov 2026 09:50:30 -0500
Message-ID: <20261124145033.627044-1-houminxi@gmail.com>
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
dp->user_features in queue_userspace_packet() stands on its own: it closes a
separate and older oops and carries its own Fixes: tag. The third patch adds
the selftest. The series is three patches; v5 had two.

v6:
 - Split the single read of dp->user_features out of the fix. It closes a
   crash that aea0bb4f8ee5 introduced in 2014, and folding it into a patch
   whose Fixes: tag points at 35d39fecbc24 hid that from a stable backport.
   Link: https://lore.kernel.org/netdev/20261118065435.2367014-1-houminxi@gmail.com/
 - Move Fixes: and Cc: into the trailer block; they had prose below them.
 - Read the field with READ_ONCE() in ovs_dp_set_user_features(), now that
   every write to it is a single WRITE_ONCE(), and clear only the recirc bit
   through one helper instead of repeating the mask at two sites.
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
   that changes or clears the recirc bit, including ovs_dp_reset_user_features()
   and __dp_destroy().
 - Clear only the recirc bit in __dp_destroy(), so an upcall that is reading
   the other bits keeps seeing them.

v3: https://lore.kernel.org/netdev/20261110174651.972936-1-houminxi@gmail.com/
 - Describe the user namespace path in the commit message.
 - Check the feature bit and the reference count in the selftest instead of
   only the return value.

v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
 - Split the selftest into its own patch.
 - Add the ovs-dpctl set-dp command the selftest needs.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (3):
  net: openvswitch: read the datapath features once when sending an
    upcall
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  70 +++++--
 net/openvswitch/datapath.h                    |   7 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 195 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  74 +++++++
 5 files changed, 331 insertions(+), 18 deletions(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1

