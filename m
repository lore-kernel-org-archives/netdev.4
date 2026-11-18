Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018603;
	b=GrRBCtXjaJSqZ3mhjifKju61d8xNjzaWl9znUVLi7ZupL6A7MRqbjuuNzkJgSZI99DDP
	 MzlWL/exaX4sznQMBHngP0ogqXQ9YbrnyKXqbPKswmKjUhnRUv7l/ezPYi2X22trLNZ3V
	 xf9hRGUfYX62gkUp5pklWDpafHR+1v6uNu04bEuUwAIJ2oo1mgjSXB1Aq3z1TsxLymFf1
	 2F3K1jakvAREd07ktlARSfdNpWk5n1/DYCbkIorYmf3MadWr1Lh42YdrJB2qxUdvcffX9
	 Ge/9Inru2NyaXZPHw03u0VmybZurV2+WZjHKefyR/ki4R3+KG/l2IAXYH8W32m93auw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
	b=P7KwzLZlVxioY5MQqoPUCah6INAyyAQes8pTI3jBQg/yeNSBGHLfIv1WZXEMOBhIU2J4
	 jSPuHulLT8VnWxCBVJu2Y0dAQiSSHV+mca8WSZXD4kNykEQJ/SsQSyz6w0bfci9LRfzux
	 zJpAyiptlO+ei/d77uyMRm/ABERSr9HzKLEzX7IUqdNfVOIcdk3CauXr83k1VsSgnEhvL
	 VmIFQfYOQh12DwlqDqSP1d5Mklv1D9eRFBlc86TTdrXBevLMTdxuRJhQTM/28IVDzvdqd
	 KcOE5VApjW0tN7t1I8OfFQWCHQ0qvEyHCNQI0qBmNO1TTJ+PD5FWdrk9ctsSG3I5Wqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccxItMpV;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B8606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccxItMpV
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so222095a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018602; x=1795623402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
        b=ccxItMpV0dtW5594Xn7TJbW87gSKf4IvHD9fjpkuHCHYo8sZ/oVnH4fgzRiCpDDbrV
         /qu2j6GRtqKMMYYSVqZgLlnwtnE+hO9y3ml5GKeMO98wh3avt47mhDK/7ukjdRhAo+qg
         TiEwsEiLIzhHrzksmEUFCSShU4FPRZw1Gr6NNwIf9oZfrSp/6znwyk+yMTqemulec254
         FGyuIfPUopBor+IUXqEWzuhNjfBro1d43eQCqesDB2lwxGw4HwMDy1dI0b3AOlk0nnoS
         ysF9iGijvW/kquY0gJ4vSMxDPvH++EQo498pEwftCrC6Eu1mS+drpV7+DM9P4tY9b1q6
         M/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018602; x=1795623402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
        b=M6hYOlqSucUv2ysryinhRAHAj9wNUrG3ATgUEOqiJruKMg7gxFaf65osTh611kKpSF
         i3XEmwiQQndFyRZibSy2QsTnLg3LfzC1izfkZdNMDX2Vghx3o5jxNYImmZFCHF2TvC1K
         JAfvaXXJ2SYvArrZJH7up/Jk/wZ2WmY/4LMunusw8QtL+X2K12bctsdonkArfUuqYboG
         KzX/risW3xAcNHuB61WqJql91AL5V+psjkIMut9z9sSQ3hzLtFBHCn8jEw5MSCz1o9R0
         oWwi+9oFGQL1rzA1C0qoXCfMtzkPc3DCZfbsxPDBaSMMJIKJ8hRGLuxn4zxzo/XCrDBl
         Ft3A==
X-Gm-Message-State: APuU4Z8tfSTMzDwDQkzacrfJ8XIlEpzIuVdFtSb3F6EvYhZRTDiBwNE8
	Od4mr8ejh1kSPHxErzXlYq+QR6m3rdSjZkrODjYbbdAQyP0T4ZlC9tG1
X-Gm-Gg: AZFdTZdP/EajCGakwxYbYMBcZOmbmoEvUQBcFR7FW1JO6CCbdtJUnc3tQ0fVCBtkWIt
	BHOX3LdcP1fifsO0IeIEeIi1Y+bZkZpILEpZ9OYGNhoEdwYENI36I1VHL6xlZFSw6ArD7cqOP5C
	FhthvmwzhmnLvy021AemQqKE5S9rwU/Fv3BLl4UINRgBP8QzCVkkRJz4H36D1aSeTxyWCFC3RqM
	cufxC+Bb0JFdPrbWWFRD3mNRWv8QGopbovQ2koq3NRy4RgNyVGXfy1NnHNBMQbhtYXp0aSdtvqt
	74i6GIRWIoD5Dl+H7rIVuloHRxakk6/boFFot4wtzj0LhnaaAO4D5lNbYdKZmxQthY1vNNYTRkB
	BSPC/wLfVg4avo+WgavRDgx50x+aXvvPCv3XNerG6xm+sV1yC36b+BxC3C1a5muOiqZ075TH6v2
	shCbSpR1WxjxThn8s2DIJVjMZLNpPTOo1VI0u9XxNmW7Tp6U5w83skvgWckOhfwUAWu/kKqGRV6
	Ao1MK8ErbRPSQl6bm5fdb0xfI909a94UNiM3r8S1DDLgStaAMP4WjLSFaX1jFq3ybpVndRcp8F2
	EWhi1v50cyJRGDJnYvB3YZ0QbWVNAX7dbz3X5DBus3lZVVU=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr3428395a91.6.1795018601880;
        Wed, 18 Nov 2026 08:16:41 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde533658e4sm256978a12.2.2026.11.18.08.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:41 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	qmo@kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH bpf-next v2 1/2] bpf: Reject offloaded maps as map-in-map inner maps
Date: Thu, 19 Nov 2026 00:16:31 +0800
Message-ID: <20261118161632.177820-1-shlomojune6@gmail.com>
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

Offloaded ARRAY/HASH maps share map_type with the software maps but use
bpf_map_offload_ops and a different object layout.  bpf_map_meta_equal()
compares map_type, key/value size, flags and the btf record only, so an
offloaded map can be inserted into an outer map created from a software
template.  The verifier and JIT then use the software layout on the
offloaded object: an ARRAY lookup writes to bpf_offloaded_map.dev_priv
and a HASH lookup reads bpf_htab fields past the 320-byte allocation.
An offloaded map used as inner_map_fd is accepted too and leads to a
NULL map_lookup_elem call.

Drop map_meta_equal from bpf_map_offload_ops so the existing check
rejects offloaded templates, and compare ops in bpf_map_meta_equal() so
an offloaded candidate no longer matches a software template.

Fixes: a38845729ea398 ("bpf: offload: add map offload infrastructure")
Link: https://lore.kernel.org/all/20261112105620.57520-1-shlomojune6@gmail.com/
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/map_in_map.c | 7 ++++---
 kernel/bpf/syscall.c    | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/map_in_map.c b/kernel/bpf/map_in_map.c
index 0fa3f2ac0f992f..9ec3bbfb5d4e3c 100644
--- a/kernel/bpf/map_in_map.c
+++ b/kernel/bpf/map_in_map.c
@@ -38,6 +38,7 @@ struct bpf_map *bpf_map_meta_alloc(int inner_map_ufd)
 	if (!inner_map_meta)
 		return ERR_PTR(-ENOMEM);
 
+	inner_map_meta->ops = inner_map->ops;
 	inner_map_meta->map_type = inner_map->map_type;
 	inner_map_meta->key_size = inner_map->key_size;
 	inner_map_meta->value_size = inner_map->value_size;
@@ -65,7 +66,6 @@ struct bpf_map *bpf_map_meta_alloc(int inner_map_ufd)
 	}
 
 	/* Misc members not needed in bpf_map_meta_equal() check. */
-	inner_map_meta->ops = inner_map->ops;
 	if (inner_map->ops == &array_map_ops || inner_map->ops == &percpu_array_map_ops) {
 		struct bpf_array *inner_array_meta =
 			container_of(inner_map_meta, struct bpf_array, map);
@@ -88,8 +88,9 @@ void bpf_map_meta_free(struct bpf_map *map_meta)
 bool bpf_map_meta_equal(const struct bpf_map *meta0,
 			const struct bpf_map *meta1)
 {
-	/* No need to compare ops because it is covered by map_type */
-	return meta0->map_type == meta1->map_type &&
+	/* An offloaded map has the map_type of a host map and its own ops */
+	return meta0->ops == meta1->ops &&
+		meta0->map_type == meta1->map_type &&
 		meta0->key_size == meta1->key_size &&
 		meta0->value_size == meta1->value_size &&
 		meta0->map_flags == meta1->map_flags &&
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 60c4d84b9aba6f..0cae12c3f70849 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -112,7 +112,6 @@ int bpf_check_uarg_tail_zero(bpfptr_t uaddr,
 }
 
 const struct bpf_map_ops bpf_map_offload_ops = {
-	.map_meta_equal = bpf_map_meta_equal,
 	.map_alloc = bpf_map_offload_map_alloc,
 	.map_free = bpf_map_offload_map_free,
 	.map_check_btf = map_check_no_btf,
-- 
2.43.0

