Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543342;
	b=dZG8t7fRZZ2hls6UvmRo6lC2ddpcf1eFYZM6Ki2VQjXgspCAx1ncfDHNlDNGszAECrb1
	 P1N6E3hu5+gHiXtUXIsRxSIJbABFos7CngQjHAeSb6rU4BdA+fDjEIbH1nnLrU36Tsw7u
	 w/jV+qTp+7+1YfpIB1ZcNITkILkZ+3P/AOS5/A8CIKmYnV9/ZjyfdJYR6/px9DPQx2Q2o
	 eeSviK3bx+jsQz/m+SVzJbL4AGfbG/znSwp/hEq0oTVZ0DJbUrz8EU58CI1yKsSx02xF5
	 Tc+5qzIyY6lZGQe4O4/0etEe9HF4LdfC/AbCL/V9DwH8DP4HMCOLUbYbyoWHf6GFeEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33N6nppwAVnKKBYceWauLEoa1aobYJcqsNr0QGEBnN4=;
	b=bdVIfMtQeT6Yz+S2q987wda6144A6GH7nZ8vp0e1UrhfMibtPmQyHI7vLKwhih0JukSY
	 dGtp/Eg9oEUEGkVj6y9YZfxMEmp1GnR3t+7J3WHbyJEuPuq/E/5BvZZ9z9DTQj09kCoUJ
	 s4Pe/5/1zGNbYOZ7wkQpeFUNgxZr9dNqWUj3rqDWbqwsFlMMxAIdUtkwhgf9MZuzeX6UQ
	 CvzvhR8prcEnxdjust2QVvEyU5z9UsfssJ6LvwDfOLeHWOSk5I7qRC7TFV54BBhiYMQnI
	 Yrkt3MJC4yj4+PxfzN6gpb9tFc/2dNBOdx5MQn2g4BWw4+61xAjGsc6OfifLOYKOt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul0ouC10;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85E606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D85E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul0ouC10
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOGpOqm4083338;
	Tue, 24 Nov 2026 18:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=33N6nppwAVnKKBYceWauLEoa1aobYJcqsNr
	0QGEBnN4=; b=Ul0ouC10QvW2esu0K3nhbHmKNKR+cF47PQI6HJ1BY3/Oo60FHoI
	kCyuVnarhBPGaHtoBqcDV9XgT4BEDCrkfVfMba5ua0Nc9pQ7mZuvTr9fdXsy+/bD
	zFtu2jDos5R+W+7dIZsJWC7bNCjIECijZd+JbvM7nNpHsZpOqIR0aRzFYRCrORC5
	kD7NYZUy+BNudAyr2fraoDfF4eSMoNbBh2FDvDvGGGSldjjn3ZuYH2myFU2S6/1M
	vxgJgF3+P2Kuw258c9gXycoYu+ErGFwFSgISRB3dFDX2ofI2YzeAUfe3OyKep+sZ
	ceWCSAYjmZscsZuzHDdBifUOsMwoQEcM7bQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effrcct-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:01:49 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHsEMT987559;
	Tue, 24 Nov 2026 18:01:48 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com [10.81.84.220])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AOI1miH999512
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:01:48 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 4696302)
	id 16D17221A9; Tue, 24 Nov 2026 10:01:48 -0800 (PST)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
        riana.tauro@intel.com, aravind.iddamsetty@linux.intel.com,
        rodrigo.vivi@intel.com, raag.jadav@intel.com, simona.vetter@ffwll.ch,
        airlied@gmail.com, kuba@kernel.org, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Extend drm_ras for qaic telemetry
Date: Tue, 24 Nov 2026 10:01:28 -0800
Message-ID: <20261124180137.616249-1-zachary.mckevitt@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b05d10d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GTUgH3iTEpiwU7-jJgcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfX6FjbGptKRnvQ
 Vio2Q9jKL29YcVb2/AIMz53uVsTuXZTlHmbD7y1RcsJNJSt7ZVLctOBRt8EihDZmPZrjZtLtwEz
 ttsxKmK/d33PUZwvBOnSeUhP9UY3SxEng5QSpdUU1YGqcMS8wVvKpQGHTcjrFupE8wc41jlHTNK
 eWO2rjz1rpjM2lNosdu4mHPxFNcApSu9VyUaBWf9G36mJGMm7TqzKMp2i8BobKeNzL/OKb8MFdY
 WX4iQ0/qPmlwu43b+St7lnsKkcRcGFBdMZGFi10PkWmuqWgD8gMRqSm2Hpb0DF5z65Jft3KuQEG
 468nD9/Ohr0c4wmZnaUhlK9B8Doftt5I0F3XYkEG3Delb7Bc+UZbup2TnVab8LBxuOZTRHbiQmI
 4qTjEdRYq/ME4fBhJcYPIOeyRjtyKzZjbEBVcPUoqpay67RLizpDvi2xw0DAvtPVXKdLrLl6nMG
 4+evH/T6vOaFAoJNDQQ==
X-Proofpoint-GUID: CzFN6lkb6WKJp8uDK4bmSVvjXW6SCQlO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfX5CIMCOOoMxjW
 l/zGaZEzqali2ZvLEcC6KgBtbcK4Mnr+GH5Lc7vIYdCXd6QsgjtK8ghxMwp6BxbLAHF+Lg9PkP8
 +zR0burBLQxHlteqZuipwA5s2qEz8F4=
X-Proofpoint-ORIG-GUID: CzFN6lkb6WKJp8uDK4bmSVvjXW6SCQlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240070

This patch series extends the drm_ras netlink interface to include a new
node type for telemetry nodes. Telemetry nodes support three operations:
getting, setting (optional), and listing telemetry fields. Drivers may
specify an optional predoit function to validate get and set operations.

Telemetry get operations take the drm_ras node id and telemetry field to
be read and return the field's value and any status reported by the driver.
Telemetry set operations take the node id, telemetry field, and value,
and return only the status reported by the driver.

Before adding telemetry nodes, a new patch is introduced to add refcounts
to drm_ras nodes stored in the xarray. This protects the nodes, which are
owned by the device, from being unregistered and freed in the middle of
a netlink doit such as getting an error counter.

This extension also removes the admin requirement on the list-nodes
operation. This allows drm_ras nodes to be discovered by userspace programs
for drivers that do not necessarily require admin privileges, like qaic.

The new drm_ras telemetry interface is implemented by the qaic driver,
which exposes the telemetry fields to userspace and enforces filesystem-
esque permission checks on telemetry operations in its telemetry_pre
callback.

Claude Opus 5.5 was used to assist in the development of these patches and
to address Sashiko feedback.

Changes in v5:
 - Address Sashiko comments:
    - Convert mode from u8 to uint in drm_ras netlink spec.
    - Add check for qdev->dev_state != QAIC_ONLINE in telemetry_request().
    - Flush the tele_wq workqueue after mhi_unprepare_from_transfer in
      qaic_telemetry_mhi_remove.
 - Small formatting fixes.

Link to v4: https://lore.kernel.org/all/20261117233442.407877-1-zachary.mckevitt@oss.qualcomm.com/

Changes in v4:
 - Add refcounts to track drm_ras node lifetimes.
 - Address Sashiko comments:
    - Fix status field population when HW returns an error.
    - Add refcounts for telemetry nodes.
    - Update outdated commit messages.
    - Add static to private functions in qaic_telemetry.c, and remove them
      from qaic_telemetry.h.
    - Stop returning remaining jiffies when device status is nonzero in
      telemetry_request().
    - Add mhi_unprepare_from_transfer if drm_ras node registration fails
      in qaic_telemetry_mhi_probe().
 - Consolidate get/set dumpits into a single dump operation.
 - Pin telemetry node to context in pre-doit and unpin in post-doit.
   This ensures the same node is used between pre-doit and doit calls.
 - Change field attribute to uint and status to sint.
 - Added NL_SET_BAD_ATTR calls to telemetry netlink functions.
 - Reject non-telemetry nodes in telemetry get/set/list-fields.
 - Updated qaic Kconfig to depend on DRM_RAS.

Link to v3: https://lore.kernel.org/all/20261106181225.3333260-1-zachary.mckevitt@oss.qualcomm.com/#t

Changes in v3:
 - Address Sashiko comments:
    - Properly return status when telemetry request is successful but a
      hardware error occurs.
    - Validate telemetry fields against their gettable/settable fields
      lists when invoking the predoit.
    - Update documentation in include/drm/drm_ras.h.
    - Moved calls to qaic_drm_ras_register/unregister to mhi_probe/remove
      instead of pci_probe/remove.
    - Added srcu read locks around calls to telemetry_request() in get
      and set callbacks in qaic_telemetry.c.
    - Added a tele_ch check to telemetry_request().
    - Properly handle a -ERESTARTSYS return from
      wait_for_completion_interrputable in telemetry_request().
    - Ensure field can be truncated to a u8 in qaic's telemetry get and
      set callbacks.
 - Minor code cleanups (typos, header ordering, etc).

Link to v2: https://lore.kernel.org/all/20261029203000.1763447-1-zachary.mckevitt@oss.qualcomm.com/

Changes in v2:
 - Address Sashiko comments:
    - Initialize certain stack variables in drm_ras.c.
    - Added attribute guards (GENL_REQ_ATTR_CHECK) in telemetry doits.
    - Added a valid node check in drm_ras_nl_pre_telemetry.
    - Fixed improper node callback in telemetry_set.
    - Now registering drm_ras node after MHI initialization.
    - Now removing drm_ras node before freeing MHI controller.
    - Added scoped_with_init_fs guard to qaic_telemetry_pre's inode check.
    - Fixed improper kfree in qaic_drm_ras_register_node.
 - Changed telemetry value attribute to sint and dropped padding attribute.
 - Updated documentation in drm_ras.yaml.
 - Renamed telemetry read/write to get/set.
 - Added dumpit for gettable and settable telemetry values.
 - Made telemetry_set optional and added admin-perm for it.
 - Specified ynl file regeneration in commit message for patch 2.

Link to v1: https://lore.kernel.org/all/20261009173152.2436195-1-zachary.mckevitt@oss.qualcomm.com/

Zack McKevitt (4):
  drm/drm_ras: Reference-count nodes across netlink handlers
  drm/drm_ras: Remove admin-perm flag from list-nodes operation
  drm/drm_ras: Extend DRM RAS interface to include telemetry nodes
  accel/qaic: Add callbacks for DRM RAS netlink telemetry

 Documentation/netlink/specs/drm_ras.yaml |  98 +++-
 drivers/accel/qaic/Kconfig               |   1 +
 drivers/accel/qaic/Makefile              |   1 +
 drivers/accel/qaic/qaic.h                |  19 +
 drivers/accel/qaic/qaic_drv.c            |  15 +
 drivers/accel/qaic/qaic_telemetry.c      | 564 +++++++++++++++++++++
 drivers/accel/qaic/qaic_telemetry.h      |  14 +
 drivers/gpu/drm/drm_ras.c                | 611 ++++++++++++++++++++---
 drivers/gpu/drm/drm_ras_nl.c             |  45 +-
 drivers/gpu/drm/drm_ras_nl.h             |  10 +
 include/drm/drm_ras.h                    |  98 ++++
 include/uapi/drm/drm_ras.h               |  29 +-
 include/uapi/drm/qaic_accel.h            |  28 ++
 13 files changed, 1462 insertions(+), 71 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_telemetry.c
 create mode 100644 drivers/accel/qaic/qaic_telemetry.h

-- 
2.43.0

