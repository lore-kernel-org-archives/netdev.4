Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519597;
	b=2IBtTP+YUe7CKNlFVhVEQS+tWMI905JHSAhvFZLwTMfdQ+0EF7rAq567VIsKQib4yz0N
	 uFofaZ2WpZvMFkq2y3+5yYZEo4aLwzi6+56gB+dVcXYqZ+zIwn/JYX9QvfOlUJAp6ko4g
	 YCFnoNy2wd7rvm5KNZ4Pp2LKqcT8TZk3LMmfT6J4ssw7Q6fE+41UPA4nXE9cajeshf3SW
	 yf8uiCM8GwBwiEIpEi1DPqkFr2K216+RPAmqTQy8Dm7Fwt9ORUf8eKkCfJtUQHX6yUkFc
	 WpU8ueAf9Brx2ktE8d1PtoolHgjeZD+/gnmLWNLeNmlhYbnSTG1OZibx5kAP2vv6HbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aBBkZUCZ/0EJxZ3yNmCwBFcXFFqep/KFSI38/raVTAE=;
	b=tf2w46zzxNAq5y2GjzomGPGFQqTsEQ9t0IaFYiMsUuDPN221+cGQ85eV6HwDXvpaFTIn
	 B1XS1uzXde88iO+Hh6e4bDYODFaf7tUy1AOM0oOOpv6ENYSDV5BDVp8YKkhPMdrbX0TMd
	 etJRYbEc3kzAC2Ydzrz0OFKX364hMT64pnch4xFWttlzKuNRFN7aqQePpeH22ELAENsk+
	 xcE7lEI12vpHipi70wYvxPVhqfpAz6kZrMWaymU0VpTO45HTMSc4uWGb1zMR9+WJCwoag
	 Kq8Zg0TSlK3wqWddh1sC5zPYHJw7b7RxtP5ZSQrw2vdNp/UHsw5l5WmNJyNXvrEl+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3J5+wfH;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0596606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0596606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3J5+wfH
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c337edfeso69379eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519595; x=1796124395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBBkZUCZ/0EJxZ3yNmCwBFcXFFqep/KFSI38/raVTAE=;
        b=A3J5+wfHK9RKn8RKMAiPw9GL5hB1bva68fzv41DTjUTvSXtS+JFxB1B1laQ2xTawGE
         lf6AAdTnAhCIycvQgA4Skg+T30AfJzesk8Dnbg6SiDlY4Hl9pe0fL2yWwnFqOL/iDRyh
         zs0MYQsQARp30KjEWW7e/MV/zrDnYPC+IdyRpzxttLC4irilEEB/ZH1tFqxd9V4eaIal
         pkVN5hVlG8NwPL3P3c4vsyKYOvNtir/H4okyuA8higwS33gJCmdQpauwe5mD7nmUFYBE
         jHB2HoLJO47JL0gc41HHN4Fv7WB3I0FUoNVcYIp8Bh7tpzG8iAPjZQGhbfjUkSQwJLFy
         lwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519595; x=1796124395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBBkZUCZ/0EJxZ3yNmCwBFcXFFqep/KFSI38/raVTAE=;
        b=l15HhSZ5TfD9FALsmOsEpFlcylGCqkiJLsdJHg3VnxwBQbOCIHKn+bcdMcqCK0Tqhk
         pur2zCMOODbilyE9edQX70pGHCPs1+hWz7OMNdztwH0KhOSiBHg0nyC1IetdPQ4IYwHC
         UBVyZM6YUJbV8ka93ihgQrpFSeCYca+Kihym2DlMPTOCnSDBgGTKi6B5+yOHEYXHoOKO
         n3rjDztD7VhMnD7G34eCWwd2fHWssybSKnZ3Ql8KUR5w6PWRUVXEyb58EvVRj0R+xzQl
         xVqwWL/mgL90UBxFg198nsJnfWSc9mIaQ48iOeBUmuj962VbGLCRq7EapMWNaR+OR08c
         Gd5Q==
X-Gm-Message-State: APuU4Z8GhDTQp6PktQ7Eb3mAffrXzPXm/KO3qJ41GPFngtJE08IJq6rw
	6ezaK7Wh8v1k2v+KTMPlGCiAJB63O0tR8KwunGcXy6Jx1YU6r50LjM67
X-Gm-Gg: AZFdTZe4Lgko7Ah+5NCe1665ZT0zx4kOvOoAihaZDO+G/5jeBO1tt54tv8hnIsK9PSY
	UadGcVZSwaeb0hGd0hG+YlVIbF/NNQVq3axaJyHaJNn4n/9BCZ5hbH8Xgf4TYVg4rAkYeITWr6F
	Xjf+PjIhA5oq1lkjN2ohX0/Su7VkcHpsMyx0bJVAiF2ND4cqEriHFP5ZYSKN1pDoPe2RtfYUDoC
	TuR6kHozwIeHGHYk6hBehxiYI72dXSOskGyRjnqiOUYIofKTw53+QtVOUSfCqBercw0DNYxHqFq
	8EpVYx95xr7rYMMb20IcpzwUt3VM6/aRWcnu+egWCDf4MWtcNgRhUNZ8PBVZL8RIFfmgxQvllYq
	40tAM7IFKgqMoGi4C60hiBiRi3icZ8Zhsk/YJH0/MSuBzKkJpLDclhBgcvrvByshCh3ksEiEnv9
	Cf6JLUxyuyrbMZtAGOLbMJUNhH60ZgeD8+pB4D9k1qKUULh8BRVB0so/mSXbenoS5fN6SZP8h22
	mSsVx9sszSsQzv5X681eSUiFbWTwKppIJf5Py0J+gWijz7aiIbURLETrgPdmRWimHBvym7O00YU
	yihTNTqBnR42okBWTpEb7dpP2JhpvcN2lHIjwqAbVW0V7wqkPx9Q
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr24082962eec.1.1795519594859;
        Tue, 24 Nov 2026 03:26:34 -0800 (PST)
Received: from localhost.localdomain ([14.47.155.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm46086998eec.12.2026.11.24.03.26.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 03:26:34 -0800 (PST)
From: Minseok Kim <kor8821@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	aleksander.lobakin@intel.com,
	stable@vger.kernel.org
Subject: [PATCH iwl-net v2] ice: bound the CEE DCBX priority-group id before using it as a traffic-class index
Date: Tue, 24 Nov 2026 20:26:31 +0900
Message-ID: <20261124112631.43172-1-kor8821@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CABBEkySNmAHTuoiC3jZqvAS31AdzMb2bHe3x0EAKQGibf0xi9g@mail.gmail.com>
References: <CABBEkySNmAHTuoiC3jZqvAS31AdzMb2bHe3x0EAKQGibf0xi9g@mail.gmail.com>
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

The CEE DCBX priority-group ID (PGID) is a four-bit wire field spanning
0..15, whereas prio_table[] is sized to ICE_MAX_TRAFFIC_CLASS (8):

  #define ICE_CEE_PGID_PRIO_0_M  (0xF << ICE_CEE_PGID_PRIO_0_S)
  #define ICE_CEE_PGID_PRIO_1_M  (0xF << ICE_CEE_PGID_PRIO_1_S)

The IEEE ETS parser in ice_dcb.c masks the equivalent nibble field with
0x7 (ICE_IEEE_ETS_PRIO_{0,1}_M) so it cannot exceed 7, whereas neither
CEE path bounds the value.

In the wire LLDP TLV path, ice_parse_cee_pgcfg_tlv() extracts each
nibble into prio_table[i] and inspects it to select tsatable[i], but
never rewrites prio_table[i], leaving values 8..15 intact -- including
the defined sentinel ICE_CEE_PGID_STRICT (15).  In the firmware AQ path,
ice_cee_to_dcb_cfg() remaps only ICE_CEE_PGID_STRICT to oper_num_tc - 1
and lets values 8..14 fall through untouched.

Downstream consumers then use prio_table[i] directly as a traffic-class
index:

- ice_vc_get_qos_caps() (virt/virtchnl.c) indexes local array
  u8 tc_prio[ICE_MAX_TRAFFIC_CLASS] via tc_prio[tc] |= BIT(i), writing
  past the end of the stack array when tc >= 8.
- ice_dcb_tc_contig() (ice_dcb_lib.c) accumulates used_tc |=
  BIT(prio_table[i]) into a u8; for values >= 8, BIT() is >= 0x100 and
  truncates to zero, causing the contiguity check to pass silently.
- ice_vsi_cfg_netdev_tc() (ice_lib.c) indexes
  vsi->tc_cfg.tc_info[ets_tc].netdev_tc with ets_tc = prio_table[i],
  reading past the end of tc_info[].

The driver already enforces this invariant when writing prio_table[] in
ice_dcbnl_set_pg_tc_cfg_tx() and at the VF trust boundary in
ice_vc_cfg_q_bw().  Bounding the PGID at CEE ingest enforces the
invariant at a single boundary and prevents the u8 BIT() truncation in
ice_dcb_tc_contig() that per-array bounds checks would miss.

Fixes: 015307754a19 ("ice: Support VF queue rate limit and quanta size configuration")
Cc: stable@vger.kernel.org
Signed-off-by: Minseok Kim <kor8821@gmail.com>
---
v2: resend in plain text only.  v1 (Message-ID
    <CABBEkySNmAHTuoiC3jZqvAS31AdzMb2bHe3x0EAKQGibf0xi9g@mail.gmail.com>)
    was sent with a web mail client that word-wrapped the diff and added an
    HTML part, so it does not apply and netdev@ rejected it outright.  No
    code or commit-message changes.

    Resent from kor8821@gmail.com; v1 came from for8821@g.skku.edu.
    Same author, switching to an address that will not expire.
    Signed-off-by updated to match the From line.

Notes on testing and tool assistance (per
Documentation/process/generated-content.rst):

- Tool assistance: Claude Code (Anthropic) was used during static source
  auditing of the CEE DCBX parsing paths, to draft the initial commit
  description and bounds check, and to run build/style checks.  All
  findings, code changes, and commit text were independently verified
  and edited by the author, who takes full responsibility for the patch.
- Testing: Compile-tested only on x86_64 (defconfig + CONFIG_PCI_IOV +
  CONFIG_DCB + CONFIG_ICE) with `make W=1 drivers/net/ethernet/intel/ice/`
  against a clean baseline build, and checked with `scripts/checkpatch.pl
  --strict` (0 errors, 0 warnings, 0 checks).  No reproducer was built
  and no runtime testing was performed due to lack of E810 hardware or a
  QEMU device model; the out-of-bounds accesses are established from
  source inspection and header constants.

 drivers/net/ethernet/intel/ice/ice_dcb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_dcb.c b/drivers/net/ethernet/intel/ice/ice_dcb.c
index abea84f14658..a36458b01fc2 100644
--- a/drivers/net/ethernet/intel/ice/ice_dcb.c
+++ b/drivers/net/ethernet/intel/ice/ice_dcb.c
@@ -407,6 +407,15 @@ ice_parse_cee_pgcfg_tlv(struct ice_cee_feat_tlv *tlv,
 			dcbcfg->etscfg.tsatable[i] = ICE_IEEE_TSA_STRICT;
 		else
 			dcbcfg->etscfg.tsatable[i] = ICE_IEEE_TSA_ETS;
+
+		/* The CEE PGID is a four-bit wire field, so a peer can name a
+		 * priority group this driver has no traffic class for.  Several
+		 * consumers use the value to index ICE_MAX_TRAFFIC_CLASS-sized
+		 * objects, so clamp it here, after the strict-priority sentinel
+		 * above has been consumed.
+		 */
+		if (etscfg->prio_table[i] >= ICE_MAX_TRAFFIC_CLASS)
+			etscfg->prio_table[i] = 0;
 	}
 
 	/* Number of TCs supported (1 octet) */
@@ -805,6 +814,10 @@ ice_cee_to_dcb_cfg(struct ice_aqc_get_cee_dcb_cfg_resp *cee_cfg,
 			/* Map it to next empty TC */
 			dcbcfg->etscfg.prio_table[i] = cee_cfg->oper_num_tc - 1;
 			dcbcfg->etscfg.tsatable[i] = ICE_IEEE_TSA_STRICT;
+		} else if (dcbcfg->etscfg.prio_table[i] >=
+			   ICE_MAX_TRAFFIC_CLASS) {
+			dcbcfg->etscfg.prio_table[i] = 0;
+			dcbcfg->etscfg.tsatable[i] = ICE_IEEE_TSA_ETS;
 		} else {
 			dcbcfg->etscfg.tsatable[i] = ICE_IEEE_TSA_ETS;
 		}
